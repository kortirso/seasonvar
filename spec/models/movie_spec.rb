RSpec.describe Movie, type: :model do
  it { should have_many(:seasons).dependent(:destroy) }
  it { should have_many(:purchases).dependent(:destroy) }

  it 'factory should be valid' do
    movie = build :movie

    expect(movie).to be_valid
  end

  describe '.film?' do
    let!(:movie) { create :movie }

    context 'for film' do
      it 'returns true' do
        expect(movie.film?).to eq true
      end
    end

    context 'for tv_show' do
      let!(:season) { create :season, movie: movie }

      it 'returns false' do
        expect(movie.film?).to eq false
      end
    end
  end

  describe '.tv_show?' do
    let!(:movie) { create :movie }

    context 'for film' do
      it 'returns false' do
        expect(movie.tv_show?).to eq false
      end
    end

    context 'for tv_show' do
      let!(:season) { create :season, movie: movie }

      it 'returns true' do
        expect(movie.tv_show?).to eq true
      end
    end
  end

  describe '.can_be_purchased?' do
    let!(:movie) { create :movie }
    let!(:tv_show) { create :movie }
    let!(:season) { create :season, movie: tv_show }

    context 'for film' do
      it 'returns true' do
        expect(movie.can_be_purchased?).to eq true
      end
    end

    context 'for tv_show movie' do
      it 'returns false' do
        expect(tv_show.can_be_purchased?).to eq false
      end
    end

    context 'for season' do
      it 'returns true' do
        expect(season.can_be_purchased?).to eq true
      end
    end
  end
end
