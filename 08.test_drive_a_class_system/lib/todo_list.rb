class TodoList
  def initialize
    @list = []
  end

  def add(todo) # todo is an instance of Todo
    # Returns nothing
    @list << todo
  end

  def incomplete
    # Returns all non-done todos
    @list.reject(&:done?)
  end

  def complete
    @list.select(&:done?)
  end

  def give_up!
    @list.each(&:mark_done!)
  end

end