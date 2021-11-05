FROM ruby:latest
COPY task.rb /
WORKDIR /task
COPY Gemfile /task/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

# Configure the main process to run when running the image
CMD ["ruby", "task.rb"]
