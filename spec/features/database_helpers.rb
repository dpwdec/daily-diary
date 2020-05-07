def populate_database
  connection = PG.connect(dbname: 'diary_manager_test')

  connection.exec("INSERT INTO entries(title, body) VALUES ('Day 1 at Pokemon Academy', 'On my first day at pokemon trainer school I caught a gyrados.');")
  connection.exec("INSERT INTO entries(title, body) VALUES ('Day 2 my first pikachu', 'On my second day I met a pikachu!');")
  connection.exec("INSERT INTO entries(title, body) VALUES ('Day 3 meeting evee', 'On the third day I made friends with evee');")
end
