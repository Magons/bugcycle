# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
Please create RoR project which will help me to find “Bicycle” as quick as possible, as I don’t want to reinvent it (at least I want people to think so).
Your app should be well designed, fast and easy in usage.
Design suggestions:
● Users;
● Bicycle Categories (bicycle can have only one category);
● “Bicycles”. Possible attributes: name, image (Bugcycles must have a
face!), description.
● Suggestions to “Bicycles”. Each logged in user can edit a bike, but this
changes will be suggested to “bicycle” owner, so he can approve it.
● “Bicycle” Usage (think about it as about Likes). When I mark something as
used I don’t want see it in the search result anymore!!!
Key Features:
● Ajax Search by title and description. (no gems). Case insensitive. Don’t
forget to exclude bikes which was already used by current user.
● Filtering by Categories
● Pagination (gem could be used)
 Perfection Has No Limits

                                          ● Authentication (Devise could be used, but your own implementation would be appreciated as well)
● Restrictions: no more than 1 suggesion to one “Bicycle”.
● Each user has his own panel where he can add/remove his bicycles
or merge suggestions.
● Each bike should have unique name (case insensitive).
● Please use Bootstrap or Foundation for FE.
● Authorization via CanCanCan or Pundit. There is no much things to
authorize, but just show that you Can do it.
Expected flow:
● bundle install;
● db preparing;
● db seeding. Please provide some records for each model;
● start server;
● Sign in with credentials email: pierre@michaux.com; password:progenitor;
Project should be landed on
github.
Expected Time: 3-4 days.
Please send your project in any case (even if it’s unfinished). Also describe things which are undone.
Any additional ideals are welcome ;)

