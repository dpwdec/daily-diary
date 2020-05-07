require 'diary'
require 'pg'

describe Diary do
  describe '.entries' do
    it 'returns a list of entries' do
      connection = PG.connect(dbname: 'diary_manager_test')

      connection.exec("INSERT INTO entries(title, body) VALUES ('Day 1 at Pokemon Academy', '');")
      connection.exec("INSERT INTO entries(title, body) VALUES ('Day 2 my first pikachu', '');")
      connection.exec("INSERT INTO entries(title, body) VALUES ('Day 3 meeting evee', '');")

      entries = described_class.entries

      expect(entries[0].title).to eq('Day 1 at Pokemon Academy')
      expect(entries[1].title).to eq('Day 2 my first pikachu')
      expect(entries[2].title).to eq('Day 3 meeting evee')
    end
  end

  describe '.add_entry' do
    it 'adds an entry to entries list' do
      entry_data = described_class.add_entry('Day 4 watering Venasaur', '')
      expect(entry_data['title']).to eq('Day 4 watering Venasaur')
    end
  end

  describe '.get_entry' do
    it 'returns an entry by id' do
      connection = PG.connect(dbname: 'diary_manager_test')
      connection.exec("INSERT INTO entries(id, title, body) VALUES (1, 'Day 1 at Pokemon Academy', '');")
      expect(described_class.get_entry(1).title).to eq('Day 1 at Pokemon Academy')
    end
  end

  describe '.udpate_entry' do
    it 'updates an entry' do
      entry_data = described_class.add_entry('Day 4 watering Venasaur', '')
      updated_data = described_class.update_entry(entry_data['id'], 'Day 5 feeling alive', '')
      expect(entry_data['title']).to_not eq(updated_data['title'])
    end
  end
end
