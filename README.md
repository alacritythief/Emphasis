Emphasis
========

[emphasis.herokuapp.com](https://emphasis.herokuapp.com/)

A "Breakable Toy" project for Launch Academy, Emphasis is an animation framework, as well as a content management system for webcomics built with Ruby on Rails.

This is currently a work-in-progress, so do not expect it to be functioning until Mid-October 2014.


EMPHASIS TODO List
------------------

* Javascript/Canvas animation system


COMPLETED
---------

* ER Diagram
* Create basic models: Comics, Pages, Elements
* User model, roles
* CRUD features of models
* Create basic schema with migrations
* Basic UI, views, forms, styling
* Pagination
* Allow the upload of elements via Carrierwave/S3


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
|   Comic.cover_image      |            +------>  Page.name                     |
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
                  |     Element.x                       <------------+
                  |     Element.y                       |      |
                  |     Element.z                       <------+
                  |     Element.animation_type          |
                  |     Element.page_id                 |
                  |     Element.user_id                 |
                  |                                     |
                  |     Additional Element Variables    |
                  |           Belongs to Page           |
                  |           Belongs to User           |
                  |                                     |
                  +-------------------------------------+

```
