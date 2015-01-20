require("rspec")
require("task")

describe(Task) do

  describe("#do_it") do
    it("returns the value of 'do_it'") do
      test_task = Task.new({:do_it => "dishes", :due => nil, :list_id => nil})
      expect(test_task.do_it()).to(eq("dishes"))
    end
  end

  describe("#due") do
    it("returns the value of 'due'") do
      test_task = Task.new({:do_it => "dishes", :due => "yesterday", :list_id => nil})
      expect(test_task.due()).to(eq("yesterday"))
    end
  end

  describe("#list_id") do
    it("returns the value of 'list_id'") do
      test_task = Task.new({:do_it => "dishes", :due => nil, :list_id => 42})
      expect(test_task.list_id()).to(eq(42))
    end
  end

  describe(".all") do
    it("displays all tasks in a list--begins empty") do
      expect(Task.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves a task to a list") do
      test_task = Task.new({:do_it => "dishes", :due => nil, :list_id => nil})
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end

  describe(".clear") do
    it("clears out all the tasks from all the lists") do
      test_task = Task.new({:do_it => "dishes", :due => nil, :list_id => nil})
      test_task.save()
      test_task2 = Task.new({:do_it => "homework", :due => "everyday", :list_id => nil})
      test_task2.save()
      Task.clear()
      expect(Task.all()).to(eq([]))
    end
  end




end
