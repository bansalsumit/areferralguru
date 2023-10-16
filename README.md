# AreferralGuru
A rails application for business to gets more customers by incentivizing referrals for their business.

## Technologies

* Ruby 3.1.0

* Rails 7.0.2

* PostgreSQL

## Table of contents
* [AreferralGuru](#areferralguru)
* [Technologies](#technologies)
* [Setup System](#setup-system)
* [Setup Database](#setup-database)
* [Features](#features)
* [Other information](#other-information)

## Setup System
To run this project:

```
$ git clone git@github.com:bansalsumit/areferralguru.git
$ cd ./areferralguru
$ rvm install 3.1.0
$ comment the cancancan line in Gemfile
$ bundle install
$ after this gem install rails -v 7.0.2
```

# Setup Database
```
rails db:create
rails db:migrate
rake db:seed
```

## Features
* **Login functionality for: admin, third party client(business), customer**
![Login Page](./app/assets/images/demo/login_page.png)
* **To check App Navigations and what main sections it have visit dashboard page**
![Dashboard Page](./app/assets/images/demo/dashboard_page.png)
* **To check Referral Report by client/business**
![Referral Report](./app/assets/images/demo/referral_report.png)
* **To add emails template which can shown in your customer email**
![Emails Template](./app/assets/images/demo/emails_template.png)
* **To Engage customer to referral program Manually**
![Engage Customer To Referral Program](./app/assets/images/demo/engage_customer_to_referral_program.png)
* **Contact Us page**
![Contact Us Page](./app/assets/images/demo/contact_us_page.png)
* **My Rewards Page**
![Reward Page Part1](./app/assets/images/demo/my_rewards_page_part1.png)
![Reward Page Part2](./app/assets/images/demo/my_rewards_page_part2.png)
* **Roles Page**
![Reward Page Part1](./app/assets/images/demo/roles_page.png)
* **Widgets Page**
![Widget Part](./app/assets/images/demo/widgets_page.png)

## Other information
* Author - Sumit Bansal
* Github - https://github.com/bansalsumit
