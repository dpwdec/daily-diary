require 'pg'

class Diary
  def self.entries
    result = connect_to_database.exec('SELECT * FROM entries')

    @list_of_entries = []

    result.each do |entry|
      @list_of_entries << DiaryEntry.new(entry['id'], entry['title'], entry['body'])
    end

    @list_of_entries
  end

  def self.add_entry(title, body)
    query = <<-SQL
    INSERT INTO entries(title, body)
    VALUES  ('#{title}', '#{body}')
    RETURNING id, title, body;
    SQL

    connect_to_database.exec(query).first
  end

  def self.update_entry(id, title, body)
    query = <<-SQL
    UPDATE entries
    SET title = '#{title}', body = '#{body}'
    WHERE id = #{id}
    RETURNING id, title, body;
    SQL

    connect_to_database.exec(query).first
  end

  private

  def self.connect_to_database
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'diary_manager_test')
    else
      PG.connect(dbname: 'diary_manager')
    end
  end

  def self.get_entry(id)
    entry_hash = connect_to_database.exec("SELECT * FROM entries WHERE id = #{id};").first
    DiaryEntry.new(entry_hash['id'], entry_hash['title'], entry_hash['body'])
  end

end
