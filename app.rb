# require("bundler/setup")
require("sinatra")
# require("sinatra/reloader")
# also_reload("lib/**/*.rb")
require("./lib/client")
require("./lib/stylist")
require("pg")

DB = PG.connect({:dbname => "hairsalon_db"})

get("/") do
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:index)
end
