def say_hello(name)
  return "hello #{name}"
end

greeting = say_hello("kay")
puts greeting

# Intended output:
#
# > say_hello("kay")
# => "hello kay"