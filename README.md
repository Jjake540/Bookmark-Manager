# Bookmark_Manager

### To set up the database

Connect to `psql` and create the `bookmark_manager` and `bookmark_manager_test` database:

```
CREATE DATABASE bookmark_manager;
CREATE DATABASE bookmark_manager_test;
```

To set up the appropriate tables, 
connect to each of the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

## User Stories

```
As a user
I want to see websites that I like all in one place
I want to see a list of bookmarked websites

As a time-pressed user
So that I can save a website
I would like to add the site's address and title to bookmark manager

As a user
So I can store bookmark data for later retrieval
I want to add a bookmark to Bookmark Manager

As a user
So I can remove my bookmark from Bookmark Manager
I want to delete a bookmark

As a user
So I can update a bookmark from Bookmark Manager
I want to update a bookmark

As a user
I want the bookmarks to work
I want to only be able to save a valid URL

As a user
So that I can make notes
I want to add a Comment to a Bookmark

As a user
So that I can find relevant bookmarks
I want to filter Bookmarks by a Tag
```

## Domain Model


![Domain Model bookmark manager](![Domain Model bookmark manager](https://user-images.githubusercontent.com/77396594/133771009-d84460a9-7522-436c-8b60-00d93b9a9887.png)
