require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/task")
require("./lib/list")
require("pg")

DB = PG.connect({:dbname => "to_do"})

get("/") do
  @lists = List.all()
  erb(:index)
end

post("/add_list") do
  name = params.fetch("name")
  @list = List.new({:name => name})
  @list.save()
  @lists = List.all()
  redirect("/")
end

get("/list/:name") do
  @list = List.search(params.fetch("name"))
  erb(:list)
end

post("/add_task") do
  do_it = params.fetch("do_it")
  @task = Task.new({:do_it => do_it})
  @task.save()
  @list = List.search(params.fetch("name"))
  @list.add_task(@task)
  erb(:list)
end
