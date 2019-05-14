RSpec.describe MovieSerializer do
  let!(:movie) { create :movie }
  let(:serializer) { described_class.new(movie).to_json }

  %w[id title plot created_at].each do |attr|
    it "serializer contains movie #{attr}" do
      expect(serializer).to have_json_path(attr)
    end
  end
end
