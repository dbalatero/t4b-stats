[![Build Status](https://travis-ci.org/dbalatero/t4b-stats.svg?branch=master)](https://travis-ci.org/dbalatero/t4b-stats)

# t4b-stats

Codebase for the Text 4 Bernie stats page. Pull requests welcome!

## Requirements

* rvm
* direnv
* sqlite3 for development/test

## Getting started

```
git clone git@github.com:dbalatero/t4b-stats.git
cd t4b-stats (should create a gemset)
bundle install
rake db:create db:migrate
cp .envrc.example .envrc
```

You'll need to fill out the variables in `.envrc` in order to successfully
import data from the text4bernie data feed.

Please contact dbalatero@gmail.com to get a sample dump of data to work
with, and/or to inquire about data access. We can probably work something out.

Ideally we can make it work so that any patches you contribute can use fake data
in RSpec, or an older database dump to verify!
