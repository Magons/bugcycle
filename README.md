# Bugcycle

## Development Setup

    bundle
    cp config/database.yml.example config/database.yml
    vim config/database.yml
    cp config/secrets.yml.example config/secrets.yml
    vim config/secrets.yml
    rake db:setup

## Sample Users

    Sign in with credentials email: pierre@michaux.com; password:progenitor;

## Description
    Please create RoR project which will help me to find “Bicycle” as quick as possible, as I don’t want to reinvent it (at least I want people to think so).
    Your app should be well designed, fast and easy in usage.
    Design suggestions:

  * Users
  * Bicycle Categories (bicycle can have only one category)
  * “Bicycles”. Possible attributes: name, image (Bugcycles must have a
    face!), description
  * Suggestions to “Bicycles”. Each logged in user can edit a bike, but this
    changes will be suggested to “bicycle” owner, so he can approve it.
  * “Bicycle” Usage (think about it as about Likes). When I mark something as
    used I don’t want see it in the search result anymore!!!
    Key Features:
  * Ajax Search by title and description. (no gems). Case insensitive. Don’t
    forget to exclude bikes which was already used by current user.
  * Filtering by Categories
  * Pagination (gem could be used)
    Perfection Has No Limits
  * Authentication (Devise could be used, but your own implementation would be
    appreciated as well)
  * Restrictions: no more than 1 suggesion to one “Bicycle”.
  * Each user has his own panel where he can add/remove his bicycles
    or merge suggestions.
  * Each bike should have unique name (case insensitive).
  * Please use Bootstrap or Foundation for FE.
  * Authorization via CanCanCan or Pundit. There is no much things to
    authorize, but just show that you Can do it.
