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
|   Comic.cover_img_url    |            +------>  Page.name                     |
|   Comic.name             |            |      |  Page.number                   |
|   Comic.description      <------------------->  Page.page_type default:page   |
|   Comic.creators         |            |      |  Page.user_id                  |
|   Comic.user_id          |            +------>  Page.comic_id                 |
|                          |                   |                                |
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
                  |                                     |            |
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
                  |     Additional Element variables    |
                  |           Belongs to Page           |
                  |           Belongs to User           |
                  |                                     |
                  +-------------------------------------+

```
