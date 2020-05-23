require "test_helper"


describe Vote do
  describe 'all_ready_voted' do

    before do
      @album = Work.create!(category:'album', title: 'test album', creator: 'Chelsea', publication_year: 1999, description:'This is a album')
    end 

    it 'return true if a user has already voted for a work ' do
      user = User.create!(name: "chel")
      vote1 = Vote.create!(work_id: @album.id, user_id: user.id)

      result = Vote.all_ready_voted(@album.id, user.id)
      expect(result).must_equal true
    end

    it 'return false if a user has not voted for a work ' do
      user = User.create!(name: "chel")

      result = Vote.all_ready_voted(@album.id, user.id)
      expect(result).must_equal false
    end
  end
end
