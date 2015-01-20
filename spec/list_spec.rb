require("rspec")
require("list")

describe(List) do

  describe("#name") do
    it("returns the name of a list") do
      test_list = List.new({:name => "chores", :id => nil})
      expect(test_list.name()).to(eq("chores"))
    end
  end

  describe("#id") do
    it("returns the id of a list") do
      test_list = List.new({:name => "chores", :id => 3})
      expect(test_list.id()).to(eq(3))
    end
  end

  describe(".all") do
    it("returns all the list objects created - empty at first") do
      expect(List.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves each new to do list") do
      test_list = List.new({:name => "chores", :id => nil})
      test_list.save()
      expect(List.all()).to(eq([test_list]))
    end
  end

  describe(".clear") do
    it("clears all lists") do
      test_list = List.new({:name => "chores", :id => nil})
      test_list.save()
      test_list2 = List.new({:name => "movies", :id => nil})
      test_list2.save()
      List.clear()
      expect(List.all()).to(eq([]))
    end
  end

  

end
