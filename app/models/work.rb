class Work < ApplicationRecord

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

