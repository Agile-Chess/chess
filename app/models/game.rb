<<<<<<< HEAD
class Game < ApplicationRecord
  has_many :pieces
  #has_many :users
  #this relationship is incorrect
end

  
=======
class Game < ApplicationRecord
  has_many :pieces
  has_many :users

  BOARD_SIZE = 8
  

  
end
>>>>>>> 0ce1168d22a70a51e2372aea2bd59e49de923fb8
