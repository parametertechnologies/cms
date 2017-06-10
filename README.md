# CMS

[![Build Status](https://travis-ci.org/parametertechnologies/cms.svg?branch=master)](https://travis-ci.org/parametertechnologies/cms)

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

$ rails db:setup
```

## Test Setup
```
$ brew install chromedriver
```

## Running Tests
```
$ bin/rails test
```
