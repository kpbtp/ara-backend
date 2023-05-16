require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should validate presence of email' do
    user = User.new(email: nil, encrypted_password: 'password')

    expect(user).to_not be_valid
    expect(user.errors[:email]).to include("can't be blank")
  end

  it 'should validate presence of encrypted_password' do
    user = User.new(email: 'test@example.com', encrypted_password: nil)

    expect(user).to_not be_valid
    expect(user.errors[:encrypted_password]).to include("can't be blank")
  end
end





