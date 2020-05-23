require "test_helper"

describe User do
  describe 'validations' do
    before do
      # Arrange
      @user = User.new(name:'chelsea')
    end

    it 'is valid when all one filed is present' do
      # Act
      result = @user.valid?
      # Assert
      expect(result).must_equal true
    end

    it 'is invalid without a name' do
      # Arrange
      @user.name = nil
      # Act
      result = @user.valid?
      # Assert
      expect(result).must_equal false
      expect(@user.errors.messages).must_include :name
    end
  end

  describe 'relations' do
    it 'set vote work_id and user_id through work and user' do
      # Create two models
      album = Work.create!(category:'album', title: 'test album', creator: 'chelsea', publication_year: 1999, description:'This is a album')
      user = User.create!(name:"chelsea")
      # Make the models relate to one another
      vote = Vote.create!( id: nil,
        name: nil,
        created_at: nil,
        updated_at: nil,
        work_id: album.id,
        user_id: user.id)

      expect(vote.work).must_equal album
      expect(vote.user).must_equal user
    end
  end
end
