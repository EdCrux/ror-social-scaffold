[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![LinkedIn][linkedin-shield]][linkedin-url]
[![LinkedIn][linkedin-shield2]][linkedin-url2]

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <h2 align="center"> Social media app: Stay In Touch</h2>
  <p align="center">
     This is the repo for the webapp Stay In Touch in [stay-in-touch-by-kit-ed.herokuapp.com](http://stay-in-touch-by-kit-ed.herokuapp.com/). This is a social media app where a user can sign upn authenticated user can interact with others, send friendship invitations and see only the posts of their friends. We made use of our diverse knowledge of rails in ActiveRecord, ActionController and RSpec for testing.
    <br />
    <a href="https://github.com/EdCrux/ror-social-scaffold"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/EdCrux/ror-social-scaffold">View Demo</a>
    ·
    <a href="https://github.com/EdCrux/ror-social-scaffold/issues">Report Bug</a>
    ·
    <a href="https://github.com/EdCrux/ror-social-scaffold/issues">Request Feature</a>
  </p>
</p>

## Table of Contents
* [About the Project](#about-the-project)
  * [Built With](#built-with)
* [Instalation guide](#instalation-guide)
* [Test](#test)
* [Roadmap](#roadmap)
* [Contact](#contact)
* [Contributing](#contributing)
* [Show your support](#show-your-support)
* [Acknowledgements](#acknowledgements)
* [License](#license)
<!-- ABOUT THE PROJECT -->

## About The Project
<em>Click on the image to visit the live version! available at [stay-in-touch-by-kit-ed.herokuapp.com/](https://stay-in-touch-by-kit-ed.herokuapp.com/)</em>
[![Product Name Screen Shot][product-screenshot]](https://stay-in-touch-by-kit-ed.herokuapp.com/)


The Entity Relation Diagram for this project was the following,
<img align="center" src="doc/erd.png" height="600" />

In this project we planned all the associations needed for the funtionality and ensured the following features: 
   * As a guest user:
    - Able to create account/log in.
    - Only see “Sign in” and “Sign out” page.

   * As a logged-in user:
    - Access all users list.
    - Access selected user page with their user name and all posts written by them (the most recent posts on the top).
    - Send a friendship invitation.
    - Access button “Invite to friendship” next to the name of user who is not my friend yet - on both users’ list and single user page.
    - Access pending friendship invitations sent to me from other users.
    - Accept or reject friendships invitation.
    - Create new posts (text only).
    - Like/dislike posts (but I can like single post only once).
    - Add comments to posts.
    - Access “Timeline” page with posts (with number of likes and comments) written by me and all my friends (the most recent posts on the top).
    - Timeline page should be the root page of the app.

### Built With
The project was developed using the following technologies:
- [RUBY v2.7.0](https://www.ruby-lang.org/es/)
- [RUBOCOP LINTERN](https://github.com/microverseinc/linters-config/tree/master/ruby)
- [RUBY ON RAILS v5.2.4](https://rubyonrails.org/)
- [DEVISE gem](https://github.com/heartcombo/devise)
- [RSPEC gem](https://github.com/rspec/rspec-rails)
- [POSTGRES >=v10.12](www.postgresql.org)


## Instalation Guide
Click on the following [link](https://gitpod.io/github.com/EdCrux/ror-social-scaffold),

1.- Wait for the workspace to load and then click on the terminal, type `brew install postgresql` and hit enter to install postgres for database
2.- After it finishes, You will be promptd with a message: "A service is available on port 8334", select: "Make Public"
3.- Copy and paste the last line you get from your terminal, it should be something like `pg_ctl -D /home/linuxbrew/.linuxbrew/var/postgres start` and hit enter to start the postgres server
4.- After it finishes, You will be promptd with a message: "A service is available on port 5432", select: "Make Public" and close the new notification
5.- After its done, type `bundle install` to install all required gems
6.- Go to config/database.yml and double click to edit
7.- Go to line 22 and 23 and uncomment them, save with ctrl + s
8.- Run `rails db:create` and hit enter
9.- Run `rails db:migrate` and hit enter
10.- Run `rails c` and hit enter to interact with the objects in the console (User, Comment, Friendship, Like, Post: see the schema for more information)

-> or see the direct page working on https://stay-in-touch-by-kit-ed.herokuapp.com/ and you can test it directly in the browser!!

## Test

For the test, click on the following [link](https://gitpod.io/github.com/EdCrux/ror-social-scaffold),

* Follow steps 1 to 9 from the [Instalation Guide](#instalation-guide) above
* Once you are done, type `rspec --format documentation` and press enter to see the 35 test for this project
* You can see the test files by clicking on the left panel in the folder spec and checking the files inside models and integrations

## Roadmap

See the [open issues](https://github.com/EdCrux/ror-social-scaffold/issues) for a list of proposed features (and known issues).

## Contact
<p align="center">

  Project Link: [https://github.com/EdCrux/ror-social-scaffold](https://github.com/kitpao/EdCrux/ror-social-scaffold)

<p align="center">

  Kitzia Paola Vidal Marroquin - [Github user: kitpao](https://github.com/kitpao)
</p>
<p align="center" style="display: flex; justify-content: center; align-items: center;">
    <a target="_blank" href="https://mail.google.com/mail/?view=cm&fs=1&tf=1&to=kitpao91@gmail.com">
      kitpao91@gmail.com
    </a> &nbsp; |
    <a target="_blank" href="https://github.com/kitpao/Personal_Projects">
        Portfolio
    </a> &nbsp; |
    <a target="_blank" href="https://www.linkedin.com/in/kitzia-paola-vidal/">
      LinkedIn
    </a> &nbsp; |
    <a target="_blank" href="https://twitter.com/Kitpao1">
      Twitter
    </a>
</p>

<p align="center">

  Jesus Eduardo Cruz Valdez - [EdCrux](https://github.com/EdCrux
)
</p>
<p align="center" style="display: flex; justify-content: center; align-items: center;">
    <a target="_blank" href="https://mail.google.com/mail/?view=cm&fs=1&tf=1&to=jecruxiz@gmail.com
">
      jecruxiz@gmail.com
    </a> &nbsp; |
    <a target="_blank" href="https://github.com/EdCrux?tab=repositories">
        My Repositories
    </a> &nbsp; |
    <a target="_blank" href="www.linkedin.com/in/edcrux">
      LinkedIn
    </a> &nbsp; |
    <a target="_blank" href="https://twitter.com/edcrux8">
      Twitter
    </a>
</p>

## Contributing 

🤝 Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgements
- [Microverse curriculum Rails section](https://www.microverse.org/?grsf=6ns691)
- [The Odin project: Associations](https://www.theodinproject.com/courses/ruby-on-rails/lessons/associations)
- [Rails Guides](https://guides.rubyonrails.org)

## License

📝 MIT License


<!-- MARKDOWN LINKS & IMAGES -->
[contributors-shield]: https://img.shields.io/github/contributors/EdCrux/ror-social-scaffold.svg?style=flat-square
[contributors-url]: https://github.com/EdCrux/ror-social-scaffold/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/EdCrux/ror-social-scaffold.svg?style=flat-square
[forks-url]: https://github.com/EdCrux/ror-social-scaffold/network/members
[stars-shield]: https://img.shields.io/github/stars/EdCrux/ror-social-scaffold.svg?style=flat-square
[stars-url]: https://github.com/EdCrux/ror-social-scaffold/stargazers
[issues-shield]: https://img.shields.io/github/issues/EdCrux/ror-social-scaffold.svg?style=flat-square
[issues-url]: https://github.com/EdCrux/ror-social-scaffold/issues
[license-shield]: https://img.shields.io/github/license/EdCrux/ror-social-scaffold.svg?style=flat-square
[license-url]: https://github.com/EdCrux/ror-social-scaffold/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=flat-square&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/kitzia-paola-vidal/
[linkedin-shield2]: https://img.shields.io/badge/-LinkedIn-black.svg?style=flat-square&logo=linkedin&colorB=555
[linkedin-url2]: https://www.linkedin.com/in/edcrux/
[product-screenshot]: app/assets/images/screenshot.png
[mobile]: app/assets/images/phone.png
