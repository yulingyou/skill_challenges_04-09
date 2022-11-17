class TaskList
  def initialize
    @task_list = []
  end
  def add(task) #task is an instance of Task
    @task_list << task
  end

  def all
    @task_list
  end
end

