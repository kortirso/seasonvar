RSpec.describe SeasonForm, type: :service do
  let!(:movie) { create :movie }
  let!(:season) { create :season, movie: movie }

  describe '.persist?' do
    context 'for invalid data' do
      let(:service) { SeasonForm.new(movie: nil, number: 1) }

      it 'returns false' do
        expect(service.persist?).to eq false
      end
    end

    context 'for existed season' do
      let(:service) { SeasonForm.new(movie: movie, number: season.number) }

      it 'returns false' do
        expect(service.persist?).to eq false
      end
    end

    context 'for valid data' do
      let(:service) { SeasonForm.new(movie: movie, number: season.number + 1) }

      it 'creates new season' do
        expect { service.persist? }.to change { Season.count }.by(1)
      end

      it 'and returns new season' do
        service.persist?

        expect(service.season).to eq Season.last
      end
    end
  end
end
