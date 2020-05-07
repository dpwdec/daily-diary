## User Stories

```
As a user
So that I can keep a daily diary
I want to be able to add a new Diary Entry

As a user
So that I can identify my entry in future
I want to give each Diary Entry a title

As a user
So that I can browse my previous entries
I want to see a list of Diary Entry Titles
```

## Objects

DiaryEntry

| Object | Messages |
| --- | --- |
| | id |
| | title |
| | body |

Diary

| Object | Messages |
| --- | --- |
| | entries |
| | add_entry(entry) |

## Tables

entries

| fields | type |
| --- | --- |
| id | SERIAL PRIMARY KEY |
| title | VARCHAR(300) |
| body | VARCHAR(5000) |
