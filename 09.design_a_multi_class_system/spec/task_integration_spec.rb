require 'task_list'
require 'task'

RSpec.describe "task integration" do
  it "should return one task whe one task is added" do
    my_task_list = TaskList.new
    my_task = Task.new("Wash the dog")
    my_task_list.add(my_task) 
    expect(my_task_list.all).to eq [my_task]
  end

  it "should return two task whe two tasks are added" do
    my_task_list = TaskList.new
    my_task_1 = Task.new("Wash the dog")
    my_task_2 = Task.new("Wash the cat")
    my_task_list.add(my_task_1)
    my_task_list.add(my_task_2)  
    expect(my_task_list.all).to eq [my_task_1,my_task_2]
  end
end