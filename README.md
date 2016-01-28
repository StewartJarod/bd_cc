# Code Challenge

Steps:
- clone repo
- bundle
- ```mv /config/secrets.tmp.yml /config/secrets.yml```
- Add your Better Doctor User API key to the secrets file
- start rails
- visit: `http://localhost:3000/api/v1/doctors/search?name=<% NAME %>`
- run tests: `rspec`
