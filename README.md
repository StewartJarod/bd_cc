# Code Challenge

Steps:
- clone repo
- bundle
- `cp config/secrets.tmp.yml config/secrets.yml`
- Add your Better Doctor User API key to the secrets.yml file
- `rails s`
- visit: `http://localhost:3000/api/v1/doctors/search?name=<% NAME %>`
- run tests: `rspec`
