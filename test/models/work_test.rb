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
end
