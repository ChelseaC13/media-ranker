class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :work

  def self.all_ready_voted(work_id, user_id)
    votes = Vote.find_by(work_id: work_id, user_id: user_id) 
    
    if votes
      return true
    else 
      return false
    end
  end
end
