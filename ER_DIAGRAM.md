```
                                 EMPHASIS
                                 ========

                       +---------------------------+
                       |          Users            |
                       +---------------------------+
                       |                           |
                       |      User.name            |
                       |      User.password        |
            +---------->      User.email           |
            |          |      User.role            |
            |          |      Devise stuff         |
            |          |                           |
            |          |    User has many comics   |
            |          |                           |
            |          +---------------------------+
            |
         +-----+
         |  |  |
         |  |  |
+--------v--v--v-----------+                   +--------------------------------+
|         Comics           |                   |            Pages               |
+--------------------------+                   +--------------------------------+
|                          |                   |                                |
|     Comic.name           |            +------> Page.chapter                   |
|     Comic.description    |            |      | Page.name                      |
|     Comic.creators       <-------------------> Page.number                    |
|     Comic.user_ids       |            |      | Page.page_type, default:'page' |
|                          |            +------>                                |
|   Comic has many pages   |                   |     Page has many Elements     |
|   Belongs to user(s)     |                   |     Belongs to Comic           |
|                          |                   |                                |
+--------------------------+                   +---------------------^----------+
                                                                     |
                                                                     |
                                                                     |
                  +-------------------------------------+            |
                  |              Elements               |            |
                  +-------------------------------------+            |
                  |                                     |            |
                  |     Element.id_name                 |            |
                  |     Element.image_url               |            |
                  |     Element.alt_text                |            |
                  |     Element.notes                   <------+     |
                  |     Element.x                       |      |     |
                  |     Element.y                       <------------+
                  |     Element.z                       |      |
                  |     Element.animation_type          |      |
                  |     Element.page_id                 <------+
                  |                                     |
                  |     Additional Element variables    |
                  |                                     |
                  |           Belongs to Page           |
                  |                                     |
                  +-------------------------------------+
```
