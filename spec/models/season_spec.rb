RSpec.describe Season, type: :model do
  it { should belong_to :movie }

  it 'factory should be valid' do
    season = build :season

    expect(season).to be_valid
  end
end
