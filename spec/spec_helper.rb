require('rspec')
require('client')
require('stylist')
require('pry')
require('pg')

DB = PG.connect({:dbname => 'hairsalon_db_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM clients *;")
    DB.exec("DELETE FROM stylists *;")
  end
end
