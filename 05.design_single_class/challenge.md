# {{PROBLEM}} Class Design Recipe

## 1. Describe the Problem

As a user
So that I can keep track of my music listening
I want to add tracks I've listened to and see a list of them.

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby
# EXAMPLE

class MusicList
  def initialize
    # ...
  end

  def list
    # return array
  end

  def add(music)
    # accepts string and adds array
  end
end
```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby
# EXAMPLE

# 1
music_list = MusicList.new
music_list.list => []

# 2
music_list = MusicList.new
music_list.add("Happy Song")
music_list.list => ["Happy Song"]

# 3
music_list = MusicList.new
music_list.add("Happy Song")
music_list.add("Lazy Song")
music_list.list => ["Happy Song", "Lazy Song"]
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._

