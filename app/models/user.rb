class User < ApplicationRecord
  has_many :votes
  has_many :works, through: :votes


  # not needed??
  # def self.return_name(id)
  #   user = User.find_by(id: id)
  #   p user
  #   return user.name
  # end
end
