# MODEL
class Oven
  def self.turn_oven_on
    Controller.cookie_type
  end



  def self.cookie_maker(type)
    @type = type
    if @type == "chocolate chip"
      Cookies.chocolate_chip
    elsif type == "peanut butter"
      Oven.peanut_butter
    elsif type == "oatmeal raisen"
      Oven.oatmeal
    else
      Display.type_no
    end
  end

class Cookies
  def self.chocolate_chip
    puts "helloooo"
  end
end

end
# VIEW
class Display

  attr_accessor :cookies
  def welcome
    puts "Hi, how are you?! Do you want to bake any cookies today?"
    @cookies = gets.chomp
    Controller.responses(@cookies)
  end

  def self.feedback
    puts "Cool talk to you later!"
  end

  def self.type
    puts "What type of cookie do you want to make today? Chocolate Chip, Peanut Butter or Oatmeal Raisen?"
    @type = gets.chomp.downcase
    Controller.type_response(@type)
  end

  def self.type_no
    puts "Sorry we don't make those right now :("
  end

  def self.texture
    puts "How would you like the cookies made? Doughy or Crispy?"
    @texture = gets.chomp.downcase
    Controller.texture_response(@texture)
  end

  def self.texture_doughy
    puts "I like it that way too! It will be 5 minutes"
  end

  def self.texture_crispy
    puts "Sure?! Okay, it will be 7 minutes"
  end

   def self.texture_unknown
    puts "Sorry, I don't know how to make the cookies that way!"
    Controller.how_cooked
  end

end

# CONTROLLER
class Controller
  def initialize
    @oven = Oven.new
    @display = Display.new
    @display.welcome
  end

  def self.responses(cookies)
    if cookies == "yes"
      Oven.turn_oven_on
    else
      Display.feedback
    end
  end

  def self.cookie_type
    Display.type
  end

  def self.type_response(type)
    Oven.cookie_maker(type)


  end

  def self.how_cooked
    Display.texture
  end

  def self.texture_response(texture)
    if texture == "doughy"
      Display.texture_doughy
    elsif texture == "crispy"
      Display.texture_crispy
    else
      Display.texture_unknown
    end
  end






end
start = Controller.new
