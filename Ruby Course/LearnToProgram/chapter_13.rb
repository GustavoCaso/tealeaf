#Orange Tree

class Orange

  def initialize
    @height = 0
    @age = 0
    @oranges = 0
  end

  def height
    "#{@height}cm"
  end

  def one_year_passes

    @age += 1
    @height += 100
    @oranges = 0

    if @age > 3
      if @age > 3 && @age < 6
        @oranges += 10
      elsif @age > 6 && @age < 9
        @oranges += 20
      else
        @oranges += 30
      end
    end

    if @age > 15
      puts "The tree died, I'm so sorry for your lost"
      @height = 0
      @oranges = 0
    end
  end

  def count_orange
    @oranges
  end

  def pick_orange
    if @oranges > 0
      @oranges -= 1
      "That orange was delicious"
    else
      "What are you trying to do there are no orange in the tree"
    end
  end
end

tree = Orange.new

# puts tree.height
# puts tree.height
# tree.one_year_passes
# tree.one_year_passes
# tree.one_year_passes
# tree.one_year_passes
# puts tree.height
# 11.times do
#   puts tree.pick_orange
# end
# puts tree.count_orange
# tree.one_year_passes
# tree.one_year_passes
# tree.one_year_passes
# puts tree.height
# 7.times do
#   tree.one_year_passes
# end
# puts tree.height
# tree.one_year_passes
# tree.one_year_passes
# puts tree.inspect




# Interactive Dragon

class Dragon

  def initialize(name)
    @name = name

  end

  def walk
    "I'm going outside for a walk with #{@name}"
  end

  def feed
    "I know you are hungry #{@name}, that way I'm going to the supermarket for some yami yami mices"
  end

  def dispatch(str)
    if str == "feed"
      feed
    elsif str == "walk"
      walk
    else
      "that's not a valid command"
    end
  end

end

# puts "Hy and welcome to our family this is your dragon, what will you name it"
# name = gets.chomp
# dragon = Dragon.new(name)
# puts "There are many things you could do with your dragon: walk, feed ....."
# puts "What would you like to do"
# answer = gets.chomp
# puts dragon.dispatch(answer)
