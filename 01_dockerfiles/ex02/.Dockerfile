FROM ruby:2.2.1

RUN apt-get update && apt-get install -y \
	nodejs=4.8.2~dfsg-1 \
	rails 5.2.1
ONBUILD WORKDIR /opt/app
ONBUILD COPY . WORKDIR
ONBUILD RUN bundle && bundle exec rake bootstrap

# run using docker run --rm  -it -p 3001:3001 -p 3000:3000 ruby:2.6 /bin/bash
#git clone https://github.com/iridakos/lofocats_ui.git
#cd lofocats_ui/
#bundle install
# apt-get update && apt-get install -y vim nodejs=4.8.2~dfsg-1 
# BONUS : vim config/api.yml and update the localhost to  URL of the LofoCats API
# rails s -b 0.0.0.0 -p 3000


#git clone https://github.com/iridakos/lofocats_ui.git && cd lofocats_ui/ && bundle install && apt-get update && apt-get install -y vim nodejs && rails server


#git clone https://github.com/heroku/ruby-rails-sample.git
#cd ruby-rails-sample
#bundle
#bundle exec rake bootstrap
# curl https://cli-assets.heroku.com/install-ubuntu.sh | sh
#heroku local
## db:migrate db:seed
# github



##    apt-get update && apt-get install -y vim nodejs && git clone https://github.com/RailsApps/rails-signup-thankyou.git && bundle install &&  bundle exec rake db:setup
## cd db_explorer/ && bundle install



# FROM ruby 2.5.1
#apt-get update && apt-get install -y vim nodejs
#git clone https://github.com/RailsApps/rails-signup-thankyou.git && cd rails-signup-thankyou/ && bundle install && bin/rails db:migrate RAILS_ENV=development && rails s -b 0.0.0.0 -p 3001
