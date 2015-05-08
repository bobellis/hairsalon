require("spec_helper")

describe(Client) do

  describe("#name") do
    it("returns the name of the client") do
        test_client = Client.new({:name => "Anthony", :id => nil})
        expect(test_client.name()).to(eq("Anthony"))
    end
  end

  describe("#id") do
    it("returns the id of the client") do
      test_client = Client.new({:name => "Anthony", :id => 1})
      expect(test_client.id()).to(eq(1))
    end
  end

  describe(".all") do
    it("returns an array of all clients") do
      test_client = Client.new({:name => "Anthony", :id => nil})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  describe(".find") do
    it("returns a specific client by id") do
      test_client = Client.new({:name => "Anthony", :id => nil})
      test_client.save()
      test_client2 = Client.new({:name => "Francis", :id => nil})
      test_client2.save()
      expect(Client.find(test_client2.id())).to(eq(test_client2))
    end
  end

  describe("#update") do
    it("updates a client name") do
      test_client = Client.new({:name => "Anthony", :id => nil})
      test_client.save()
      test_client.update({:name => "Francis"})
      expect(test_client.name()).to(eq("Francis"))
    end
  end

  describe("#delete") do
    it("deletes a client by id") do
      test_client = Client.new({:name => "Anthony", :id => nil})
      test_client.save()
      test_client.delete()
      expect(Client.all()).to(eq([]))
    end
  end


end
