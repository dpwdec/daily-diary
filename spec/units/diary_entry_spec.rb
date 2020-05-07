require 'diary_entry'

describe DiaryEntry do

  let(:subject) { described_class.new(1, 'Day 1 at Pokemon Academy', 'On my first day at pokemon trainer school I caught a gyrados.') }

  describe '#id' do
    it 'has an id' do
      expect(subject.id).to eq(1)
    end
  end

  describe '#title' do
    it 'has a title' do
      expect(subject.title).to eq('Day 1 at Pokemon Academy')
    end
  end

  describe '#body' do
    it 'has an entry body' do
      expect(subject.body).to eq('On my first day at pokemon trainer school I caught a gyrados.')
    end
  end
end
