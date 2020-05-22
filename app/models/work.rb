class Work < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes

  validates :category, presence: true
  validates :title, presence: true
  validates :creator, presence: true
  validates :publication_year, presence: true, numericality: { only_integer: true }
  validates :description, presence: true


  def self.spotlight
    work_group = self.all
    sorted = work_group.sort_by {|work| work.votes.count}
    top_work = sorted[-1]

    return top_work
  end

  def self.top_ten(type)
    work_group = self.where(category: type)
    sorted = work_group.sort_by {|work| work.votes.count}
    
    top_ten = []

    10.times do |i|
      if i + 1 > sorted.length
        return top_ten
      end

      top_ten << sorted[(-1) - i]
    end

    return top_ten
  end

  def self.order(type)
    work_group = self.where(category: type)
    sorted = work_group.sort_by {|work| work.votes.count}
    sorted.reverse!
 
    return sorted
  end

  def self.vote_total(id)
    votes_with_work_id = Vote.where(work_id: id)
    return votes_with_work_id.count
  end
end