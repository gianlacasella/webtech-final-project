# README

In this repository you will find Julio Cortes and Gianfranco Lacasella's Web Technologies project.

## Deletion scenarios

* **Scenario #1**: if a stay (lodge) is deleted and guests have already made reservations, all the reservations are deleted with it. We will automatically generate a private message from the platform notifying all users that the lodge has been deleted, also all the reviews related to it will be deleted as well, including the reservations that alredy happened.

* **Scenario #2**: if a user is deleted and stays and reservations have been created, all his/her reservations are deleted with it. We will automatically generate a private message from the platform to the related hosts and guests notifying it. This will also delete its complaints, guest_reviews, lodge_reviews, reservations and phonenumbers that were related to the user.
## Model modifications

* We deleted the admin model simplifying it to a is_admin boolean in user
* We deleted Calendar, and Reservations (now its pre-reservations, its a name change nothing else) because they were unnecessary to the model.
* An is_confirmed attribute was added to the PreReservations Model
* We deleted the multivalued attribute roles and changed it to a booleans is_host. since all users are inherently guest
* link to E-R: https://drive.google.com/file/d/1RXqBvPq56xWXMsw6AwQVaMH6KJKD7xqa/view?usp=sharing
   
## Before starting

Before you clone and test this repository there are some things you need to know.

* Ruby version: 3.0.0

You can verify your Ruby version with:

```
ruby --version
```

* Rails version: 6.1.3.1

You can also verify your Rails version with:

```
rails --version
```

* Configuration

To start running the project, first please be sure youre using the correct ruby version and gemset with:

```
rvm use 3.0.0@rails6
```

Then, you should move to the RAILS_ROOT and install the application's dependencies:

```
bundle install
```

* Database creation

Once you configured correctly the environment, you can create the database and seed it. Open a new rails console:

```
rails c
```

And reset the database (this will create and seed the database):

```
db:reset
```

We have created some tasks in order to test our models with Active Record Queries. To execute all the tasks, you can use:

```
db:call
```

Or, you can execute a task at a time, using:

```
db:query_n
```



# webtech-final-project
