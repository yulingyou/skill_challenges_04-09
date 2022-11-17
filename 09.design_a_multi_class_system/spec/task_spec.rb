require 'task'

RSpec.describe Task do
  it "Constructs and return title" do
    my_task = Task.new("Wash the dog")
    expect(my_task.title).to eq "Wash the dog"
  end
end