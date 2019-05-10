RSpec.describe Season, type: :model do
  it { should belong_to :movie }
  it { should have_many(:episodes).dependent(:destroy) }

  it 'factory should be valid' do
    season = build :season

    expect(season).to be_valid
  end
end
