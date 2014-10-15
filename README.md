Emphasis
========

[![Build Status](https://travis-ci.org/alacritythief/Emphasis.svg?branch=master)](https://travis-ci.org/alacritythief/Emphasis)

[emphasis.herokuapp.com](https://emphasis.herokuapp.com/)

A "Breakable Toy" project for Launch Academy, Emphasis is a content management system & framework built with Ruby on Rails that allows you to create animated & interactive webcomics.

EMPHASIS TODO List
------------------

* Add further Spec/Model tests (important)
* E-Mail verification
* Documentation for custom element shorthand
* Polish and optimization


EXTRA:
------

* Fix page gap bug
* Collaborators join table
* Animation templates for Elements
* Admin moderation, user profiles & pages
* Thumbnail optimization & resizing
* Customize alt_text for elements


COMPLETED
---------

* ER Diagram
* Models w/ validations: Comics, Pages, Elements
* User model w/ roles column
* Login w/ Devise
* CRUD features of models
* Schema with migrations
* UI, views, forms, styling
* Pagination via Kaminari
* Allow the upload of images via Carrierwave/S3
* Allow the deletion of uploaded S3 images
* JS-powered Animations via Greensock
* Custom CSS for elements
* Element script interpreter via custom decorator (coverts user shorthand to whitelisted JS)
* JS mouse events supported for only hiding and showing images


CURRENT ER DIAGRAM
------------------

```

                                 EMPHASIS
                                 ========

                       +---------------------------+
                       |          Users            |
                       +---------------------------+
                       |                           |
                       |      User.username        |
                       |      User.first_name      |
                       |      User.last_name       |
                       |      User.password        |
                       |      User.email           |
                       |      User.role            |
                       |                           |
            +---------->    User has many comics   |
            |          |                           |
            |          +---------------------------+
            |
            |
         +-----+
         |  |  |
         |  |  |                               +--------------------------------+
+--------v--v--v-----------+                   |            Pages               |
|         Comics           |                   +--------------------------------+
+--------------------------+                   |                                |
|                          |                   |  Page.chapter                  |
|  Comic.cover_image       |            +------>  Page.name                     |
|  Comic.cover_img_url     |            |      |  Page.number                   |
|  Comic.name              <------------------->  Page.page_type default:page   |
|  Comic.description       |            |      |  Page.user_id                  |
|  Comic.creators          |            +------>  Page.comic_id                 |
|  Comic.user_id           |                   |                                |
|                          |                   |    Page has many Elements      |
|   Comic has many pages   |                   |    Belongs to Comic            |
|   Belongs to user(s)     |                   |    Belongs to User             |
|                          |                   |                                |
+--------------------------+                   +---------------------^----------+
                                                                     |
                                                                     |
                                                                     |
                                                                     |
                  +-------------------------------------+            |
                  |              Elements               |            |
                  +-------------------------------------+            |
                  |     Element.image_file              |            |
                  |     Element.image_url               |            |
                  |     Element.id_name                 |            |
                  |     Element.alt_text                <------+     |
                  |     Element.notes                   |      |     |
                  |     Element.position                <------------+
                  |     Element.align                   |      |
                  |     Element.z                       <------+
                  |     Element.page_id                 |
                  |     Element.user_id                 |
                  |     Element.css                     |
                  |     Element.js                      |
                  |                                     |
                  |     Additional Element Variables    |
                  |           Belongs to Page           |
                  |           Belongs to User           |
                  |                                     |
                  +-------------------------------------+

```
