require "test_helper"

describe User do
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

  it 'is invalid without a title' do
    # Arrange
    @user.name = nil
  
    # Act
    result = @user.valid?
  
    # Assert
    expect(result).must_equal false
    expect(@user.errors.messages).must_include :name
  end
end
