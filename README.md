# CMS

## Setup

### Dependencies

  * Ruby version: ruby 2.4.1p111
  * Rails vesion: 5.1.0.rc2
  * PostgreSQL version: postgres (PostgreSQL) 9.6.2

### Database Setup

```
$ createuser --createdb --login -P cms
Enter password for new role: cms
Enter it again: cms

$ rails db:create
$ rails db:migrate
$ rails db:test:prepare
```

## Running Tests
```
$ bin/rails test
```
