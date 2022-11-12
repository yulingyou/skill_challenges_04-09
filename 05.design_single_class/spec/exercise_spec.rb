require "exercise"

RSpec.describe TodoList do
  context "given no tasks" do
  it "has an empty list" do
    todo_list = TodoList.new
    expect(todo_list.list).to eq []
    end
  end
  context "given one task" do
    it "has the task in the list" do
      todo_list = TodoList.new
      todo_list.add("Wash the car")
      expect(todo_list.list).to eq ["Wash the car"]
    end
  end
  context "given two task" do
    it "has the task in the list" do
      todo_list = TodoList.new
      todo_list.add("Wash the car")
      todo_list.add("Wash the dog")
      expect(todo_list.list).to eq ["Wash the car","Wash the dog"]
    end
  end
  context "when we complete a task" do
    it "remove the task from the list" do
      todo_list = TodoList.new
      todo_list.add("Wash the car")
      todo_list.add("Wash the dog")
      todo_list.complete("Wash the car")
      expect(todo_list.list).to eq ["Wash the dog"]
    end
  end
  context "when we try to complete non-existent task" do
    it "fail" do
      todo_list = TodoList.new
      todo_list.add("Wash the car")
      expect{todo_list.complete("wash the sheep")}.to raise_error "No such task."
    end
  end
end