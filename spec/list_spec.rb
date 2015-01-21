require("spec_helper")

describe(List) do

  describe("#name") do
    it("returns the name of a list") do
      test_list = List.new({:name => "chores"})
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
      test_list = List.new({:name => "chores"})
      test_list.save()
      expect(List.all()).to(eq([test_list]))
    end
  end

  describe(".clear") do
    it("clears all lists") do
      test_list = List.new({:name => "chores"})
      test_list.save()
      test_list2 = List.new({:name => "movies"})
      test_list2.save()
      List.clear()
      expect(List.all()).to(eq([]))
    end
  end

  describe("#==") do
    it("treats two instances of list as the same if they have the same attributes") do
      test_list = List.new({:name => "chores"})
      test_list2 = List.new({:name => "chores"})
      expect(test_list).to(eq(test_list2))
    end
  end

  describe(".search") do
    it("finds a list based on the name attribute") do
      test_list = List.new({:name => "chores"})
      test_list.save()
      test_list2 = List.new({:name => "homework"})
      test_list2.save()
      expect(List.search("homework")).to(eq(test_list2))
    end
  end

  describe("#tasks") do
    it("displays all tasks in a list--empty at first") do
      test_list = List.new({:name => "chores"})
      test_list.save()
      expect(test_list.tasks()).to(eq([]))
    end
  end

  describe("#add_task") do
    it("adds a new task to a specific list") do
      test_list = List.new({:name => "chores"})
      test_list.save()
      test_task = Task.new({:do_it => "dishes", :list_id => test_list.id()})
      test_task.save()
      test_list.add_task(test_task)
      expect(test_list.tasks()).to(eq([test_task]))
    end
  end



end
