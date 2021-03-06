class Stylist

attr_reader(:name, :id)

define_method(:initialize) do |attributes|
  @name = attributes.fetch(:name)
  @id = attributes.fetch(:id)
end

define_singleton_method(:all) do
  results = DB.exec("SELECT * FROM stylists;")
  all_stylists = []
  results.each do |stylist|
    name = stylist.fetch("stylist_name")
    id = stylist.fetch("id").to_i()
    all_stylists.push(Stylist.new({:name => name, :id => id}))
  end
  all_stylists
end

define_method(:save) do
  result = DB.exec("INSERT INTO stylists (stylist_name) VALUES ('#{@name}') RETURNING id;")
  @id = result.first().fetch("id").to_i()
end

define_method(:==) do |another_stylist|
  self.name().==(another_stylist.name()).&(self.id().==(another_stylist.id()))
end

define_singleton_method(:find) do |id|
  @id = id
  found_stylist = DB.exec("SELECT * FROM stylists WHERE id = #{@id};")
  @name = found_stylist.first().fetch("stylist_name")
  Stylist.new({:name => @name, :id => @id})
end

define_method(:update) do |attributes|
  @name = attributes.fetch(:name, @name)
  @id = self.id()
  DB.exec("UPDATE stylists SET stylist_name = '#{@name}' WHERE id = #{@id};")
end

define_method(:delete) do
  DB.exec("DELETE FROM stylists WHERE id = #{self.id()};")
end

define_method(:clients) do
  stylists_clients = []
  results = DB.exec("SELECT id FROM clients WHERE stylist_id = #{self.id()};")
  results.each() do |result|
    client_id = result.fetch("id").to_i()
    client = DB.exec("SELECT * FROM clients WHERE id = #{id};")
    name = client.first().fetch("name")
    stylists_clients.push(Client.new({:name => name, :id => id}))
  end
  stylists_clients
end

end
