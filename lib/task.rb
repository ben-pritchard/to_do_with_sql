class Task

  @@tasks = []
  attr_reader(:do_it, :due, :list_id)

  define_method(:initialize) do |attributes|
    @do_it = attributes.fetch(:do_it)
    @due = attributes.fetch(:due)
    @list_id = attributes.fetch(:list_id)
  end

  define_singleton_method(:all) do
    @@tasks
  end

  define_method(:save) do
    @@tasks.push(self)
  end

  define_singleton_method(:clear) do
    @@tasks = []
  end

end
