class List
  @@lists = []
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes[:name]
    @id = attributes[:id]
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

end
