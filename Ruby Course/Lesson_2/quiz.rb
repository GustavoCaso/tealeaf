<<-EOF

1. Name what each of the below is:


  a = 1
  # => ex. a is a local variable, and is a Fixnum object with
  value 1
  @a = 2
  user = User.new
  user.name
  user.name = "Joe"
2. How does a class mixin a module?

3. What's the difference between class variables and instance variables?

4. What does attr_accessor do?

5. How would you describe this expression: Dog.some_method

6. In Ruby, what's the difference between subclassing and mixing in modules?

7. Given that I can instantiate a user like this: User.new('Bob'), what would the initialize method look like for the User class?

8. Can you call instance methods of the same class from other instance methods in that class?

9. When you get stuck, what's the process you use to try to trap the error?

EOF

###########################################################################################################################################

#1#

@a = 2

# is a instance variable, is a Fixnum with value 2

user = User.new

# user is new object that hold a new instanciation of the User class

user.name

# is a instance method (getter) that will return the value of the @name instance variable from the user class is this specific User class instanciation

user.name = "Joe"

# is a instance method(setter) that will change the value of the instance variable @name from this instance.

#2#

# inside the class definition we have to write include (name of the module)

class User
  include Swimable
end

#3#

# a class variable makes reference in a class level so it is the same for all the object instanciated from the class and we have to prepend @@
# a instance variable makes reference to a instance odf the class, the are different from every instance we write with @ at the begining

#4#

# attr_accessor create getter and setter for the instance variables inside the class

#5#

Dod.some_method

# is a class method of the Dog class

#6#

# subclasing refer to the concept of Inheritance where a class inherite the behavior from another class usially we ask owr self if the class => is a
#  example Player is_a Gamer
#   class Player < Gamer

# Module is where we store so behavior that can be use from different classes and respond to the question has_a
#  example: Player has_a Hand
#  class Player
#   include Hand


#7#

attr_accessor :name

def initialize(name)
  @name = name
end

#8#

Yes

#9#

binding.pry