class Task

  # @@tasks = []
  attr_reader(:do_it, :due, :list_id)

  define_method(:initialize) do |attributes|
    @do_it = attributes[:do_it]
    @due = attributes[:due]
    @list_id = attributes[:list_id]
  end

  define_singleton_method(:all) do
    pure_database_tasks = DB.exec("SELECT * FROM tasks;")
    tasks = []
    pure_database_tasks.each() do |task|
      do_it = task.fetch("do_it")
      tasks.push(Task.new({:do_it => do_it}))
    end
    tasks
  end

  define_method(:save) do
    DB.exec("INSERT INTO tasks (do_it) VALUES ('#{@do_it}')")
  end

  # define_singleton_method(:clear) do
  #   @@tasks = []
  # end

  define_method(:==) do |other_guy|
    self.do_it().==(other_guy.do_it())
  end

end
