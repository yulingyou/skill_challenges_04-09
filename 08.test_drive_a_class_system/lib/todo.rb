class Todo 
    def initialize(task) # task is a string
      @task = task
      @complete = false
    end
  
    def task
      @task
    end
    def mark_done!
      # Marks the todo as done
      # Returns nothing
      @complete = true
    end
  
    def done?
      # Returns true if the task is done
      # Otherwise, false
      @complete
    end
end