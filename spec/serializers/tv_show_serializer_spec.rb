RSpec.describe TvShowSerializer do
  let!(:movie) { create :movie }
  let!(:season) { create :season, movie: movie }
  let(:serializer) { described_class.new(movie).to_json }

  %w[id title plot created_at seasons].each do |attr|
    it "serializer contains movie #{attr}" do
      expect(serializer).to have_json_path(attr)
    end
  end
end
