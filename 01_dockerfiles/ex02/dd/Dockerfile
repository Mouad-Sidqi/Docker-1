FROM ruby:2.5.1


RUN apt-get update && apt-get install -y vim \
	nodejs=4.8.2~dfsg-1
RUN gem install rails:5.2.0
ONBUILD WORKDIR /opt/app
ONBUILD COPY railsapp .
ONBUILD RUN bundle install && bin/rails db:migrate RAILS_ENV=development && bundle exec rake db:setup
ONBUILD EXPOSE 3000
#ONBUILD RUN bundle exec rake db:migrate && bundle exec rake db:setup
