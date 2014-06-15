# MODEL
class Oven
  def self.turn_oven_on
    Controller.how_cooked
  end

  def self.how_cooked

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

  def self.texture
    puts "How you liked to cooked? Doughy or Crispy?"
    @texture = gets.chomp
    Controller.texture_response(@texture)
  end

  def self.texture_doughy
    puts "it will be 5 minutes"
  end

  def self.gittexture_crispy
    puts "it will be 7 minutes"
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

  def self.how_cooked
    Display.texture
  end

  def self.texture_response(texture)
    if texture = "doughy"
      Display.texture_doughy
    else
      Display.texture_crispy
    end
  end






end
start = Controller.new
