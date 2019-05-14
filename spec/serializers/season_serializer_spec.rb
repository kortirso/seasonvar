RSpec.describe SeasonSerializer do
  let!(:season) { create :season }
  let!(:episode) { create :episode, season: season }
  let(:serializer) { described_class.new(season).to_json }

  %w[id number episodes].each do |attr|
    it "serializer contains season #{attr}" do
      expect(serializer).to have_json_path(attr)
    end
  end

  %w[id number].each do |attr|
    it "serializer contains episode #{attr}" do
      expect(serializer).to have_json_path("episodes/0/#{attr}")
    end
  end
end
