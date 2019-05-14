RSpec.describe 'Users API' do
  describe 'GET#library' do
    let!(:user) { create :user }

    it_behaves_like 'API auth without token'
    it_behaves_like 'API auth with invalid token'

    context 'for valid user' do
      let(:token) { JwtService.new.json_response(user: user)[:token] }
      let!(:movie) { create :movie }
      let!(:tv_show) { create :movie }
      let!(:season) { create :season, movie: tv_show }
      let!(:purchase1) { create :purchase, user: user, purchaseable: movie }
      let!(:purchase2) { create :purchase, user: user, purchaseable: season }
      let!(:purchase3) { create :purchase, purchaseable: movie }
      before { get '/api/v1/users/library.json', headers: { 'Authorization' => token } }

      it 'returns status 200' do
        expect(response.status).to eq 200
      end

      it 'returns only purchases of user' do
        expect(JSON.parse(response.body)['movies'].size).to eq 2
      end
    end

    def do_request(headers = {})
      get '/api/v1/users/library.json', headers: headers
    end
  end
end
