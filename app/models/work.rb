class Work < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes

  validates :category, presence: true
  validates :title, presence: true
  validates :creator, presence: true
  validates :publication_year, presence: true, numericality: { only_integer: true }
  validates :description, presence: true


  def self.spotlight
    # to code later
    work = self.find_by(category: "album")
    return work
  end



  def self.top_ten(type)
    work_group = self.where(category: type)
    top_ten = work_group.sample(10)
  
    return top_ten
  end

  def self.vote_total(id)
    votes_with_work_id = Vote.where(id: id)
    return votes_with_work_id.count

  end
    
  #in user model
  # def self.return_name(id)
  #   user = User.find_by(id)
  #   return user.name
  # end 
end

