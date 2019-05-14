RSpec.describe LibrarySerializer do
  let!(:movie) { create :movie }

  describe 'for movie purchase' do
    let!(:purchase) { create :purchase, purchaseable: movie }
    let(:serializer) { described_class.new(purchase).to_json }

    %w[id created_at].each do |attr|
      it "serializer contains purchase #{attr}" do
        expect(serializer).to have_json_path(attr)
      end
    end

    %w[id title plot created_at].each do |attr|
      it "serializer contains purchaseable #{attr}" do
        expect(serializer).to have_json_path("purchaseable/#{attr}")
      end
    end
  end

  describe 'for season purchase' do
    let!(:season) { create :season, movie: movie }
    let!(:purchase) { create :purchase, purchaseable: season }
    let(:serializer) { described_class.new(purchase).to_json }

    %w[id created_at].each do |attr|
      it "serializer contains purchase #{attr}" do
        expect(serializer).to have_json_path(attr)
      end
    end

    %w[movie season].each do |attr|
      it "serializer contains purchaseable #{attr}" do
        expect(serializer).to have_json_path("purchaseable/#{attr}")
      end
    end
  end
end
