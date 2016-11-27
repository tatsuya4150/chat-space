# CHATSPACE

### TABLES
- messages
- users
- groups
- usergroups

### Relations
- message
  - belongs_to user
  - belongs_to group
- user
  - has_many messages
  - has_many groups, through: :users_groups
- group
  - has_many messages
  - has_many users, through: :users_groups
- user_groups
  - belongs_to user
  - belongs_to group

### colums
#### messages

|id|body|image|group_id|user_id|
|:--:|:--:|:--:|:--:|:--:|
|int|txt|txt|references|references|

#### users

|id|name|email|password|
|:--:|:--:|:--:|:--:|
|int|str|str|str|

#### groups

|id|team|
|:--:|:--:|
|id|str|

#### usersgroups

|id|user_id|group_id|
|:--:|:--:|:--:|
|id|references|references|

### NOT NULL制約
- users
  - name
  - email
  - password
- messages
  - image
  - body
- groups
  - team

### 一意性制約
 - users
   - name
   - email
 - groups
    - team
