class Stylist

attr_reader(:name, :id)

define_method(:initialize) do |attributes|
  @name = attributes.fetch(:name)
  @id = attributes.fetch(:id)
end

define_method(:save) do
  DB.exec("INSERT INTO stylists (stylist_name) VALUES ('#{@name}');")
end

define_method(:all) do
  results = DB.exec("SELECT * FROM stylists;")
  all_stylists = []
  results.each do |stylist|
    all_stylists.push(stylist)
  end
  all_stylists

end

end
