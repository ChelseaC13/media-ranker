class Work < ApplicationRecord

  def self.spotlight
    # to code later
    work = self.find_by(category: "album")
    return work
  end
end

