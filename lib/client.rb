class Client

  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    results = DB.exec("SELECT * FROM clients;")
    all_clients = []
    results.each do |client|
      name = client.fetch("client_name")
      id = client.fetch("id").to_i()
      all_clients.push(Client.new({:name => name, :id => id}))
    end
    all_clients
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (client_name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_client|
    self.name().==(another_client.name()).&(self.id().==(another_client.id()))
  end

  define_singleton_method(:find) do |id|
    @id = id
    found_client = DB.exec("SELECT * FROM clients WHERE id = #{@id};")
    @name = found_client.first().fetch("client_name")
    Client.new({:name => @name, :id => @id})
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    @id = self.id()
    DB.exec("UPDATE clients SET client_name = '#{@name}' WHERE id = #{@id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM clients WHERE id = #{self.id()};")
  end



end
