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

get("/stylists") do
  @stylists = Stylist.all()
  erb(:stylists)
end

post("/stylists") do
  stylist_name = params.fetch("stylist_name")
  new_stylist = Stylist.new({:name => stylist_name, :id => nil})
  new_stylist.save()
  @stylists = Stylist.all()
  erb(:stylists)
end

get("/clients") do
  @clients = Client.all()
  erb(:clients)
end

post("/clients") do
  client_name = params.fetch("client_name")
  new_client = Client.new({:name => client_name, :id => nil})
  new_client.save()
  @clients = Client.all()
  erb(:clients)
end

get("/client/:id") do
  @stylists = Stylist.all()
  @client = Client.find(params.fetch("id").to_i())
  erb(:client)
end

get("/stylist/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist)
end

patch("/client/:id") do
  client_id = params.fetch("id").to_i()
  @new_name = params.fetch("new_name")
  @client = Client.find(client_id)
  @client.update({:name => @new_name})
  erb(:client)
end
