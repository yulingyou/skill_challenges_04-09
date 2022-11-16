# Diary Multi-Class Planned Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

As a user
So that I can record my experiences
I want to keep a regular diary
# DiaryEntry class - method add_entry(entry)

As a user
So that I can reflect on my experiences
I want to read my past diary entries
# method show_all_entries

As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed
# method reading_chunk(wpm, minutes)

As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary
# TodoList class
methods:
  add(task)
  complete(task)
  show


As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries
# PhoneBook class
methods:
  extract_numbers(text)
  list  




## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```
https://excalidraw.com/#room=9efac6212555850482c2,Yu2xpsQ7rBxPpqCbIhPLWw



```

_Also design the interface of each class in more detail._

```ruby

# ==============================================================

class Diary
  def add(entry) #entry is an instance of DiaryEntry
  end

  def entries
    # Returns a list of all added entries
  end

end

# ==============================================================

class DiaryEntry
  def initialize(title, contents)
    # ...
  end

  def title
    # Returns title as string
  end

  def contents
    # Returns contents as string
  end
end

# ==============================================================

class PhoneBook
  def initialize(diary) #diary is an instance of Diary
  end

  def extract_numbers
    # Returns a list of strings representing phone numbers gathered across all diary entries
  end
end

# ==============================================================

class DiaryReader
  def initialize(wpm,diary)
  #wpm is how many words the user can read in a minute
  #diary is an instance of Diary
  end

  def find_most_readable_in_time(time)
  # Returns an instance of DiaryEntry, corresponding to the longest readable content within the given time and wpm
  end
end

# ==============================================================

class TaskList
  def add(task) #task is an instance of Task
  end

  def all
  # Returns a list of all the tasks
  end
end

class Task
  def initialize(title) # title is a string
  end

  def title
  # Returns the title as a string
  end
end



```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# EXAMPLE

# Constructs a diary
my_diary = Diary.new
diary_entry = DiaryEntry.new("my title", "my contents")
my_diary.add(diary_entry)
my_diary.entries # => [diary_entry]

# add multiple entries in diary
my_diary = Diary.new
diary_entry_1 = DiaryEntry.new("my title 1", "my contents 1")
diary_entry_2 = DiaryEntry.new("my title 2", "my contents 2")
my_diary.add(diary_entry_1)
my_diary.add(diary_entry_2)
my_diary.entries # => [diary_entry_1, diary_entry_2]

# Extract a single phone number and add them in a list
my_diary = Diary.new
diary_entry = DiaryEntry.new("Bob", "07123123123")
my_diary.add(diary_entry)

phone_book = PhoneBook.new(my_diary)
phone_book.extract_numbers # => ["07123123123"]


# Extract multiple phone numbers and add them in a list
my_diary = Diary.new
diary_entry_1 = DiaryEntry.new("Bob", "07123123123")
diary_entry_2 = DiaryEntry.new("Bill", "blabla 07234234234 blabla")
my_diary.add(diary_entry_1)
my_diary.add(diary_entry_2)
phone_book = PhoneBook.new(my_diary)
phone_book.extract_numbers # => ["07123123123","07234234234"]


# Pick a readable diary entry within time & wpm
my_diary = Diary.new
diary_entry_1 = DiaryEntry.new("Bob", "one two")
diary_entry_2 = DiaryEntry.new("Bill", "one two three four")
my_diary.add(diary_entry_1)
my_diary.add(diary_entry_2)
diary_reader = DiaryReader.new(2, my_diary) #wpm is 2
diary_reader.find_most_readable_in_time(2) # => diary_entry_2
# user can read 2 words per minute and has 2 minute so should return diary_entry_2


# Add a task to the task list and return a task


my_task_list = TaskList.new
my_task = Task.new("Wash the dog")
my_task_list.add(my_task) 
my_task_list.all # => ["Wash the dog"]

# Add two tasks to the task list and return two tasks
my_task_list = TaskList.new
my_task_1 = Task.new("Wash the dog")
my_task_2 = Task.new("Wash the cat")
my_task_list.add(my_task_1) 
my_task_list.add(my_task_2)
my_task_list.all # => ["Wash the dog", "Wash the cat"]


```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE

# DIARY ENTRY
# Constructs a diary entry
diary_entry = DiaryEntry.new("my title", "my contents")
diary_entry.title # => "my title"
diary_entry.contents # => "my contents"


# TASK
# Constructs and return title

my_task = Task.new("Wash the dog")
my_task.title # => "Wash the dog"





```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._
