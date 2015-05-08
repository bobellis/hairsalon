require("spec_helper")

describe(Stylist) do

  describe("#name") do
    it("returns the name of the stylist") do
        test_stylist = Stylist.new({:name => "Joan", :id => nil})
        expect(test_stylist.name()).to(eq("Joan"))
    end
  end

  describe("#id") do
    it("returns the id of the stylist") do
      test_stylist = Stylist.new({:name => "Joan", :id => 1})
      expect(test_stylist.id()).to(eq(1))
    end
  end

  describe(".all") do
    it("returns an array of all stylists") do
      test_stylist = Stylist.new({:name => "Joan", :id => nil})
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
    end
  end

  describe(".find") do
    it("returns a specific stylist by id") do
      test_stylist = Stylist.new({:name => "Joan", :id => nil})
      test_stylist.save()
      test_stylist2 = Stylist.new({:name => "Greg", :id => nil})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end

  describe("#update") do
    it("updates a stylist name") do
      test_stylist = Stylist.new({:name => "Joan", :id => nil})
      test_stylist.save()
      test_stylist.update({:name => "Greg"})
      expect(test_stylist.name()).to(eq("Greg"))
    end
  end

  describe("#delete") do
    it("deletes a stylist by id") do
      test_stylist = Stylist.new({:name => "Joan", :id => nil})
      test_stylist.save()
      test_stylist.delete()
      expect(Stylist.all()).to(eq([]))
    end
  end


end
