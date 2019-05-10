RSpec.describe Movie, type: :model do
  it 'factory should be valid' do
    movie = build :movie

    expect(movie).to be_valid
  end
end
