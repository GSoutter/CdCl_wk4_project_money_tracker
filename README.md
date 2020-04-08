# Money/Spending Tracker

Brief was to build an app that allows a user to track their spending. Requiring you to create, view and edit merchants, tags, and transactions that link into those. As well as additonal funcationality that could be added such as dates, 

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

```
You will need, sinatra, pry-byebug, ruby, postgres SQL, and minitest. These can all be installed through gem
```

### Installing

Clone the files from github
Within the top of the folder run terminal. 
paste in and run code below, 

to create the database 
```
  createdb money_tracker
```

to create the database structure
```
  psql -d money_tracker -f db/money_tracker.sql
```

to seed the database
```
ruby bd/seed.rb
```

to set up server
```
ruby app.rb
```

then go to your browser and go to:
```
http://localhost:4567/
```
You are now ready to go.
