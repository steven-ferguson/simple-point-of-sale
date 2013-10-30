Simple Point of Sale
====================

This is a point of sale system built using Ruby with ActiveRecord with a command line UI. This project was for practice using ActiveRecord with a PostgresSQL database. 

Getting Started
===============

To get the app up and running you'll need to have [Postgres](http://www.postgresql.org/) installed on your system. You can find instructions on how to do this [here](http://www.learnhowtoprogram.com/lessons/installing-postgres). Once you have Postgres installed run:

    bundle install
    rake db:create
    rake db:migrate
    ruby bin/pos.rb
