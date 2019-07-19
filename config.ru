require 'fileutils'
require 'logger'
require 'sequel'
require 'pact_broker'
require 'pg'

use Rack::Auth::Basic, 'Restricted Area' do |username, password|
  username == ENV['PACT_BROKER_BASIC_AUTH_USERNAME'] && password == ENV['PACT_BROKER_BASIC_AUTH_PASSWORD']
end

app = PactBroker::App.new do | config |
  config.database_connection = Sequel.connect(ENV['DATABASE_URL'], adapter: 'postgres', encoding: 'utf8')
  config.webhook_host_whitelist = %w{ circleci.com }
end

run app
