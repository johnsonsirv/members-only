## Secret-Clubhouse (Authentication & Authorization)

This is a prototype app of an exclusive clubhouse where members can write embarrassing posts about non-members. Inside the clubhouse, members can see who the author of a post is but, outside, they can only see the story and wonder who wrote it.

It focuses on implementing authentication systems so users can only access areas of a site they are authorized to.

This project was completed in line with standards provided by [Microverse](https://www.microverse.org/ "The Global School for Remote Software Developers!").


### Built with:

* Ruby 2.4.0
* Rails 5.2.3
* Bootstrap
* RSpec and Capybara (test suite)
* Authentication using ```has_secure_password``` and ```bycrpt```
* SQLite -- ``development``
* PgSQL -- ``production``

### Installation

###### Database initialization
in your terminal ```rake db:migrate db:test:prepare```

###### How to run all test suite

in your terminal run 

``` rspec spec```

### Usage

Run ```rails server```

You can interact with this app on ```localhost://3000```

### Contributor(s)

[Victor Okeugo](https://angel.co/u/victorokeugo/)

- Github: [@johnsonsirv](https://github.com/johnsonsirv)
- Twitter: [@vokeugo](https://twitter.com/@vokeugo/)
- Email: [okeugo.victor.c@gmail.com]()

### How to contribute
1. Fork it (https://github.com/johnsonsirv/members-only/fork)
2. Create your feature branch (git checkout -b feature/[choose-a-name])
3. Commit your changes (git commit -m 'What this commit will fix/add')
4. Push to the branch (git push origin feature/[chosen name])
5. Create a new Pull Request
> You can also create [issues](https://github.com/johnsonsirv/members-only/issues)

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE.md) file for details.
