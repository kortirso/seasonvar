RSpec.describe Purchase, type: :model do
  it { should belong_to :purchaseable }
  it { should belong_to :user }

  it 'factory should be valid' do
    purchase = build :purchase

    expect(purchase).to be_valid
  end
end
