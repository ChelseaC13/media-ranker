require "test_helper"

describe Work do
  describe 'validations' do
    before do
      # Arrange
      @album = Work.new(category:'album', title: 'test album', creator: 'chelsea', publication_year: 1999, description:'This is a album')
    end

    it 'is valid when all fields are present' do
      # Act
      result = @album.valid?

      # Assert
      expect(result).must_equal true
    end

    it 'is invalid without a title' do
      # Arrange
      @album.title = nil
    
      # Act
      result = @album.valid?
    
      # Assert
      expect(result).must_equal false
      expect(@album.errors.messages).must_include :title
    end

    it 'is invalid without a category' do
      # Arrange
      @album.category = nil
    
      # Act
      result = @album.valid?
    
      # Assert
      expect(result).must_equal false
      expect(@album.errors.messages).must_include :category
    end

    it 'is invalid without a creator' do
      # Arrange
      @album.creator = nil
    
      # Act
      result = @album.valid?
    
      # Assert
      expect(result).must_equal false
      expect(@album.errors.messages).must_include :creator
    end

    it 'is invalid without a publication_year' do
      # Arrange
      @album.publication_year = nil
    
      # Act
      result = @album.valid?
    
      # Assert
      expect(result).must_equal false
      expect(@album.errors.messages).must_include :publication_year
    end

    it 'is invalid without a string as publication_year' do
      # Arrange
      @album.publication_year = "bad"
    
      # Act
      result = @album.valid?
    
      # Assert
      expect(result).must_equal false
      expect(@album.errors.messages).must_include :publication_year
    end

    it 'is invalid without a float as publication_year' do
      # Arrange
      @album.publication_year = 1.2
    
      # Act
      result = @album.valid?
    
      # Assert
      expect(result).must_equal false
      expect(@album.errors.messages).must_include :publication_year
    end

    it 'is invalid without a description' do
      # Arrange
      @album.description = nil
    
      # Act
      result = @album.valid?
    
      # Assert
      expect(result).must_equal false
      expect(@album.errors.messages).must_include :description
    end
  end




  describe 'relations' do
    it 'set vote works_id and user_id through work and user' do
      # Create two models
      album = Work.create!(category:'album', title: 'test album', creator: 'chelsea', publication_year: 1999, description:'This is a album')
      user = User.create!
      # Make the models relate to one another
      vote = Vote.create!( id: nil,
        name: nil,
        created_at: nil,
        updated_at: nil,
        work_id: album.id,
        user_id: user.id)

      # id should 
      expect(vote.work).must_equal album
      expect(vote.user).must_equal user
    end

  end

  describe 'spotlight' do
    it 'returns one object' do
      album = Work.create!(category:'album', title: 'test album', creator: 'Chelsea', publication_year: 1999, description:'This is a album')
      book = Work.create!(category:'book', title: 'test book', creator: 'Justin', publication_year: 2000, description:'This is a book')
      movie = Work.create!(category:'movie', title: 'test movie', creator: 'Huxley', publication_year: 2001, description:'This is a movie') 
    
      expect(Work.spotlight).must_equal album
    end

    it "gives the work that has the most votes" do

    end

    it "it does something in a tie" do
      
    end

    it "no works" do
      
    end

  end


  describe 'top_ten' do
    it 'returns 10 objects' do
      album1 = Work.create!(category:'album', title: '1', creator: 'Chelsea', publication_year: 1999, description:'This is a album')
      album2 = Work.create!(category:'album', title: '2', creator: 'Justin', publication_year: 2000, description:'This is a book')
      album3 = Work.create!(category:'album', title: '3', creator: 'Huxley', publication_year: 2001, description:'This is a movie') 
      album4 = Work.create!(category:'album', title: '4', creator: 'Chelsea', publication_year: 1999, description:'This is a album')
      album5 = Work.create!(category:'album', title: '5', creator: 'Justin', publication_year: 2000, description:'This is a book')
      album6 = Work.create!(category:'album', title: '6', creator: 'Huxley', publication_year: 2001, description:'This is a movie') 
      album7 = Work.create!(category:'album', title: '7', creator: 'Chelsea', publication_year: 1999, description:'This is a album')
      album8 = Work.create!(category:'album', title: '8', creator: 'Justin', publication_year: 2000, description:'This is a book')
      album9 = Work.create!(category:'album', title: '9', creator: 'Huxley', publication_year: 2001, description:'This is a movie') 
      album10 = Work.create!(category:'album', title: '10', creator: 'Chelsea', publication_year: 1999, description:'This is a album')
      album11 = Work.create!(category:'album', title: '11', creator: 'Justin', publication_year: 2000, description:'This is a book')
      
      expect(Work.top_ten("album").count).must_equal 10
    end

    it "gives the work that has the most votes" do

    end

    it "it does something in a tie" do
      
    end

    it "no works" do
      
    end

  end

  describe 'vote total' do
    it 'counts votes correctly' do
      # album = Work.create!(category:'album', title: 'test album', creator: 'chelsea', publication_year: 1999, description:'This is a album')
      # user = User.create!
      # vote = Vote.create!( id: nil, name: nil, created_at: nil, updated_at: nil, work_id: album.id, user_id: user.id)
      # vote = Vote.create!( id: nil, name: nil, created_at: nil, updated_at: nil, work_id: album.id, user_id: user.id)
      
      # expect(Work.vote_total(album.id)).must_equal 2
    
    end

    it "gives the work that has the most votes" do

    end

    it "it does something in a tie" do
      
    end
  end
end
