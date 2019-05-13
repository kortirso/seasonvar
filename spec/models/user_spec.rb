RSpec.describe User, type: :model do
  it { should have_many(:purchases).dependent(:destroy) }

  it 'factory should be valid' do
    user = build :user

    expect(user).to be_valid
  end
end
