Bundler.require
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/rails'
RSpec.configure do |config|
  config.include Rails.application.routes.url_helpers
  config.include Capybara::DSL
end
