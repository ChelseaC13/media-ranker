class Work < ApplicationRecord

  def spotlight
    # to code later
    work = self.find_by(category: "album")
    return work
  end
end

