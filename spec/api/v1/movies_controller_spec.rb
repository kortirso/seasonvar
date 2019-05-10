RSpec.describe 'Movies API' do
  describe 'GET#index' do
    let!(:movies) { create_list(:movie, 2) }
    let!(:tv_show) { create :movie }
    let!(:season) { create :season, movie: tv_show }
    before { get '/api/v1/movies.json' }

    it 'returns status 200' do
      expect(response.status).to eq 200
    end

    it 'and contains only films' do
      expect(JSON.parse(response.body)['movies'].size).to eq 2
    end

    it 'and contains serialized movies objects' do
      expect(response.body).to be_json_eql(MovieSerializer.new(movies.first).serializable_hash.to_json).at_path('movies/0')
      expect(response.body).to be_json_eql(MovieSerializer.new(movies.last).serializable_hash.to_json).at_path('movies/1')
    end
  end
end
