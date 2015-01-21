class List
  @@lists = []
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes[:name]
    @id = attributes[:id]
    @tasks = []
  end

  define_singleton_method(:all) do
    # @@lists
    lists_to_return = []
    incoming_lists = DB.exec("SELECT * FROM lists;")
    incoming_lists.each() do |list|
      name = list.fetch("name")
      id = list.fetch("id").to_i()
      lists_to_return.push(List.new({:name => name, :id => id}))
    end
    lists_to_return
  end

  define_method(:save) do
    # @@lists.push(self)
    returning_id = DB.exec("INSERT INTO lists (name) VALUES ('#{@name}') RETURNING id;")
    @id = returning_id.first().fetch("id").to_i()
  end

  define_singleton_method(:clear) do
    # @@lists = []
    DB.exec("DELETE FROM lists *;")
  end

  define_method(:==) do |other_thang|
    self.name().==(other_thang.name())
  end

  define_singleton_method(:search) do |search_by|
    found_list = nil
    List.all().each() do |list|
      if list.name().==(search_by)
        found_list = list
      end
    end
    found_list
  end

  define_method(:tasks) do
    tasks_in_list = []
    pull_back_tasks = DB.exec("SELECT * FROM tasks WHERE list_id = #{self.id()};")
    pull_back_tasks.each() do |task|
      do_it = task.fetch("do_it")
      list_id = task.fetch("list_id").to_i()
      tasks_in_list.push(Task.new(:do_it => do_it, :list_id => list_id))
    end
    tasks_in_list
  end

  define_method(:add_task) do |task|
    @tasks.push(task)
  end

end
