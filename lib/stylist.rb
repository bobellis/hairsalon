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



end
