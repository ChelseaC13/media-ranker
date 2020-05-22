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

      # id should 
      expect(vote.work).must_equal album
      expect(vote.user).must_equal user
    end

  end

  describe 'spotlight' do
    before do
      @album = Work.create!(category:'album', title: 'test album', creator: 'Chelsea', publication_year: 1999, description:'This is a album')
      @book = Work.create!(category:'book', title: 'test book', creator: 'Justin', publication_year: 2000, description:'This is a book')
      @movie = Work.create!(category:'movie', title: 'test movie', creator: 'Huxley', publication_year: 2001, description:'This is a movie') 
    end 
  
    it 'returns one object' do 
      expect(Work.spotlight).must_be_instance_of Work
    end

    it "gives the work that has the most votes" do
      user = User.create!(name: "chel")
      vote1 = Vote.create!(work_id: @book.id, user_id: user.id)
      vote2 = Vote.create!(work_id: @book.id, user_id: user.id)

      expect(Work.spotlight).must_equal @book
    end

    it "it does something in a tie" do
      user = User.create!(name: "chel")
      vote1 = Vote.create!(work_id: @movie.id, user_id: user.id)
      vote2 = Vote.create!(work_id: @book.id, user_id: user.id)

      expect(Work.spotlight).must_be_instance_of Work
    end
  end

  describe 'spotlight' do 
    it 'no works' do
      expect(Work.spotlight).must_be_nil
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

    it "puts the work that has the most votes first" do
      @album1 = Work.create!(category:'album', title: 'test album', creator: 'Chelsea', publication_year: 1999, description:'This is a album')
      @album2 = Work.create!(category:'album', title: 'test book', creator: 'Justin', publication_year: 2000, description:'This is a book')
      @album3 = Work.create!(category:'album', title: 'test movie', creator: 'Huxley', publication_year: 2001, description:'This is a movie') 
      user = User.create!(name: "chel")
      vote1 = Vote.create!(work_id: @album2.id, user_id: user.id)
      vote2 = Vote.create!(work_id: @album2.id, user_id: user.id)

      top_ten = Work.top_ten("album")
      expect(top_ten[0]).must_equal @album2
    end

    it "it places two object with a tie above the third than 10 works" do
      @album1 = Work.create!(category:'album', title: 'test album', creator: 'Chelsea', publication_year: 1999, description:'This is a album')
      @album2 = Work.create!(category:'album', title: 'test book', creator: 'Justin', publication_year: 2000, description:'This is a book')
      @album3 = Work.create!(category:'album', title: 'test movie', creator: 'Huxley', publication_year: 2001, description:'This is a movie') 
      user = User.create!(name: "chel")
      vote1 = Vote.create!(work_id: @album3.id, user_id: user.id)
      vote2 = Vote.create!(work_id: @album2.id, user_id: user.id)

      top_ten = Work.top_ten("album")
      expect(top_ten[2]).must_equal @album1
      expect(top_ten.count).must_equal 3
    end

    it "no works" do
      expect(Work.top_ten("album")).must_be_empty
    end

  end

  describe 'vote total' do
    it 'counts votes correctly' do
      @album1 = Work.create!(category:'album', title: 'test album', creator: 'Chelsea', publication_year: 1999, description:'This is a album')
      user = User.create!(name: "chel")
      vote1 = Vote.create!(work_id: @album1.id, user_id: user.id)
      vote2 = Vote.create!(work_id: @album1.id, user_id: user.id)

      expect(Work.vote_total(@album1.id)).must_equal 2
    end
  end

  describe 'order' do
    it "puts the work that has the most votes first" do
      @album1 = Work.create!(category:'album', title: 'test album', creator: 'Chelsea', publication_year: 1999, description:'This is a album')
      @album2 = Work.create!(category:'album', title: 'test book', creator: 'Justin', publication_year: 2000, description:'This is a book')
      @album3 = Work.create!(category:'album', title: 'test movie', creator: 'Huxley', publication_year: 2001, description:'This is a movie') 
      user = User.create!(name: "chel")
      vote1 = Vote.create!(work_id: @album2.id, user_id: user.id)
      vote2 = Vote.create!(work_id: @album2.id, user_id: user.id)

      order_list = Work.order("album")
      expect(order_list[0]).must_equal @album2
      expect(order_list.count).must_equal 3
    end
  end
end
