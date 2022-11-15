require 'todo'

RSpec.describe Todo do
  it "create an new task" do
    todo = Todo.new("shopping")
    expect(todo.task).to eq "shopping"
  end

  it "create an new task and mark done" do
    todo = Todo.new("shopping")
    expect(todo.mark_done!).to eq true
  end

  it "return true if task is done" do
    todo = Todo.new("shopping")
    todo.mark_done!
    expect(todo.done?).to eq true
  end
end