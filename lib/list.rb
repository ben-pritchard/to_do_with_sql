class List
  @@lists = []
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    @@lists
  end

  define_method(:save) do
    @@lists.push(self)
  end

  define_singleton_method(:clear) do
    @@lists = []
  end
end
