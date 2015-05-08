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
      expect(test_stylist.all()).to(eq([test_stylist]))
    end
  end
  
end
