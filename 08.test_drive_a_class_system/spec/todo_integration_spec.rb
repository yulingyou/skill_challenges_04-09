require 'todo'
require 'todo_list'

RSpec.describe "todo and todo_list integration" do
  context "adding instance of Todo class to TodoList" do
    it "adds the Todo to the list and it's incomplete" do
    todo_list = TodoList.new
    todo_1 = Todo.new("shopping")
    todo_list.add(todo_1)
    expect(todo_list.incomplete).to eq [todo_1]
    end

    it "adds the Todo to the list and it's complete" do
      todo_list = TodoList.new
      todo_1 = Todo.new("shopping")
      todo_2 = Todo.new("watching movie")
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_2.mark_done!
      expect(todo_list.complete).to eq [todo_2]
      end

      it "give up marks all tasks as complete" do
        todo_list = TodoList.new
        todo_1 = Todo.new("shopping")
        todo_2 = Todo.new("watching movie")
        todo_list.add(todo_1)
        todo_list.add(todo_2)
        todo_list.give_up!
        expect(todo_list.complete).to eq [todo_1, todo_2]
        end
  end
end
