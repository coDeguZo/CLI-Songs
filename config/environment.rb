require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'postgresql', database: 'cli_database')
require_all 'lib'
