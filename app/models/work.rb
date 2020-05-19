class Work < ApplicationRecord
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

    
end

