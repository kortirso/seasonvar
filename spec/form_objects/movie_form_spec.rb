RSpec.describe MovieForm, type: :service do
  let!(:movie) { create :movie }

  describe '.persist?' do
    context 'for invalid data' do
      let(:service) { MovieForm.new(title: '', plot: nil) }

      it 'returns false' do
        expect(service.persist?).to eq false
      end
    end

    context 'for existed movie' do
      let(:service) { MovieForm.new(title: movie.title, plot: 'Something') }

      it 'returns false' do
        expect(service.persist?).to eq false
      end
    end

    context 'for valid data' do
      let(:service) { MovieForm.new(title: 'Cool Movie 2', plot: 'Something') }

      it 'creates new movie' do
        expect { service.persist? }.to change { Movie.count }.by(1)
      end

      it 'and returns new movie' do
        service.persist?

        expect(service.movie).to eq Movie.last
      end
    end
  end
end
