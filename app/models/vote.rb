class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :work

  def all_ready_voted(work_id, user)
    # votes_with_work_id = Vote.where(id: work_id)
    # p votes_with_work_id
  end


end
