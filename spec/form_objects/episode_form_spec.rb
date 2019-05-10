RSpec.describe EpisodeForm, type: :service do
  let!(:season) { create :season }
  let!(:episode) { create :episode, season: season }

  describe '.persist?' do
    context 'for invalid data' do
      let(:service) { EpisodeForm.new(season: nil, number: 1) }

      it 'returns false' do
        expect(service.persist?).to eq false
      end
    end

    context 'for existed episode' do
      let(:service) { EpisodeForm.new(season: season, number: episode.number) }

      it 'returns false' do
        expect(service.persist?).to eq false
      end
    end

    context 'for valid data' do
      let(:service) { EpisodeForm.new(season: season, number: episode.number + 1) }

      it 'creates new episode' do
        expect { service.persist? }.to change { Episode.count }.by(1)
      end

      it 'and returns new episode' do
        service.persist?

        expect(service.episode).to eq Episode.last
      end
    end
  end
end
