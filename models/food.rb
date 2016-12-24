# frozen_string_literal: true

# Represents a Food's stored information
class Food < Sequel::Model
<<<<<<< HEAD
#  one_to_one :popularity
  #one_to_one :tag_amount, class: :Food 
=======
  many_to_many :foods
>>>>>>> 2f545c0e06832b3875c7da369e40c1b3d93136fd
end
