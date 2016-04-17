##Huella deportiva

**Huella deportiva** is an app that let the user read news and information about the University sports teams and their competitions

The following **required** functionality is completed:

- [x] User can see the latest news
- [x] User can see details of the news
- [x] User can post news
- [x] User can "Step Forward" a post

The following **optional** features are implemented:

- [x] Top Posts
- [ ] Steps Leaderboard
- [ ] User can share news to twitter
- [ ] News/Event Location
- [ ] Calendar with events

##Data Scheme
**User Data**

| User           |    _User        |
|----------------|-----------------|
| username       | username        |
| password       | _hashed_password|
| is admin?      | admin           |
| profile picture| prof_image      |

**News Data**

| News           |    news        |
|----------------|----------------|
| news title     | title          |
| news body      | body           |
| author         | user           |
| news image     | image          |
| post date      |_created_at     |

