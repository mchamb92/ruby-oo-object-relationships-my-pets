class Owner
    attr_accessor  :pets
    attr_reader :species, :name
  
    @@all =[]
  
    def initialize(name)
      @name = name
      @@all << self
      @species = "human"
    end
  
    def self.all
      @@all
    end
  
    def self.reset_all
      @@all.clear
    end
  
    def self.count
      self.all.count
    end
  
    def say_species
      "I am a #{@species}."
    end
  
    def buy_cat(name)
      Cat.new(name, self)
    end
  
    def buy_dog(name)
      Dog.new(name, self)

    end
  
    def walk_dogs
      self.dogs.each {|d| d.mood = "happy"}
    end
  
    def play_with_cats
      @pets[:cats].each {|c| c.mood = "happy"}
    end
  
    def sell_pets
      self.dogs.each {|d|  d.mood = "nervous"}
      self.cats.each {|c| c.mood = "nervous"}

      self.dogs.each {|d| d.owner = nil}
      self.cats.each {|c| c.owner = nil}


    end
  
    def list_pets
      "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
    end

    def cats
    Cat.all.select do |cat|
      cat.owner == self
      end
    end

    def dogs
      Dog.all.select do |dog|
        dog.owner == self
        end
    end

    def feed_cats
      self.cats.each {|c| c.mood = "happy"}
    end



end