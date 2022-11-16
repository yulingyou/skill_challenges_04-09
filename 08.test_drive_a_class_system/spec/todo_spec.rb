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
    # expect(todo.done?).to eq true
    expect(todo.done?).to be_truthy
  end

  it "return false if task is not done" do
    todo = Todo.new("shopping")
    # expect(todo.done?).to eq false
    expect(todo.done?).to be_falsy
  end
end