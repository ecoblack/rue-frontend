# Install ruby
FROM ruby:2.5.1
# Install tools for ruby
RUN apt-get update -qq && apt-get install -y build-essential

RUN mkdir -p /app
WORKDIR /app
COPY Gemfile /app/
RUN bundle install
COPY . /app
COPY ./services /app/services
COPY ./concepts /app/concepts
EXPOSE 9292
#ENTRYPOINT ["bash"]
# Start rack app
CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "5000"]
