# Oh My Community

[![Build Status](https://semaphoreci.com/api/v1/marselmustafin/oh-my-community/branches/master/badge.svg)](https://semaphoreci.com/marselmustafin/oh-my-community)

Based on Rails 5.1.2 and Ruby 2.5.1

###Basic features:

- User can register his community and become its owner

- Owner can set specific unreserved subdomain for community

- Another users can sign up as community memebers, and then sign in to it

- All users of community can create posts, add comments to it, rate posts

- Users can edit their posts and comments, Owner can edit all comments and posts

- Users can search another users by name or minimum rating, order them by rating and posts count

- Admin can manage resource through admin panel

### Bootstrap application

1. Clone application as new project with original repository named "rails-base".

   ```bash
   git clone git://github.com/marselmustafin/oh-my-community.git --origin oh-my-community [MY-NEW-PROJECT]
   ```

2. Create your new repo on GitHub and push master into it. Make sure master branch is tracking origin repo.

  ```bash
  git remote add origin git@github.com:[MY-GITHUB-ACCOUNT]/[MY-NEW-PROJECT].git
  git push -u origin master
  ```

3. Run setup script

  ```bash
  bin/setup
  ```

4. Run test and quality suits to make sure all dependencies are satisfied and applications works correctly before making changes.

  ```bash
  bin/ci
  ```

5. Run app

  ```bash
  bin/server
  ```

6. Update README

  Do not forget to update application `README.md` file with detailed information based on the
  existing template.

  ```bash
  mv doc/README_TEMPLATE.md README.md
  # update README.md
  git commit -am "Update README.md"
  ```
