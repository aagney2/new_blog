# README

This README would normally document whatever steps are necessary to get the
application up and running.

This application will be able to add, modify, delete posts or blogs
It can also have comments
It can be liked or disliked

Table name: Blog
Column name: ID, Author, Title, Description, created at, updated at
              1    nithin,  rails, Rails course, 5th aug,   5th Aug
              2    Aagney   ruby,  ruby course,   6th aug,   6th Aug

Table Nsme: Comments
Column name: ID, Commentor, Description, created at, updated at, Blog_id
              1,  Aagney,     Good one,   5th Aug,    5th Aug,    1
              2,  Aagney,     Good one,   5th Aug,    5th Aug,    1


rails routes

HTTP->GET => /blogs => Blog#index

HTTP->GET => /blogs/new => Blog#new

HTTP->POST => /blogs => Blog#create

HTTP->GET => /blogs/1/edit => Blog#edit

HTTP->GET => /blogs/1 => Blog#show

HTTP=>PUT/PATCH => /blogs/1 => Blog#update

HTTP=>DESTROY=> /blogs/1 => Blog#destory

Request Response Cycle.
-----------------------

Browser
Routes
Controller
Model
Views
Browser

Callbacks
---------
https://guides.rubyonrails.org/active_record_callbacks.html
