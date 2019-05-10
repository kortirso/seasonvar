RSpec.describe Episode, type: :model do
  it { should belong_to :season }

  it 'factory should be valid' do
    episode = build :episode

    expect(episode).to be_valid
  end
end
