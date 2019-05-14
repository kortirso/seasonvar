RSpec.describe 'Purchases API' do
  describe 'POST#create' do
    let!(:user) { create :user }

    it_behaves_like 'API auth without token'
    it_behaves_like 'API auth with invalid token'

    context 'for valid user' do
      let(:token) { JwtService.new.json_response(user: user)[:token] }

      context 'for invalid params' do
        let(:request) { post '/api/v1/purchases.json', params: { purchase: { video_quality: 'Cool' } }, headers: { 'Authorization' => token } }

        it 'does not create purchase' do
          expect { request }.to_not change(Purchase, :count)
        end

        context 'in answer' do
          before { request }

          it 'returns status 409' do
            expect(response.status).to eq 409
          end

          it 'and contains error message' do
            expect(JSON.parse(response.body)['errors']).to_not eq nil
          end
        end
      end

      context 'for valid params' do
        let!(:movie) { create :movie }
        let(:request) { post '/api/v1/purchases.json', params: { purchase: { purchaseable_id: movie.id, purchaseable_type: 'Movie', video_quality: 'HD' } }, headers: { 'Authorization' => token } }

        it 'creates purchase' do
          expect { request }.to change { Purchase.count }.by(1)
        end

        context 'answer' do
          before { request }

          it 'returns status 201' do
            expect(response.status).to eq 201
          end

          %w[id purchaseable_id purchaseable_type created_at].each do |attr|
            it "and contains purchase #{attr}" do
              expect(response.body).to have_json_path("purchase/#{attr}")
            end
          end
        end
      end
    end

    def do_request(headers = {})
      post '/api/v1/purchases.json', params: { purchase: { video_quality: 'Cool' } }, headers: headers
    end
  end
end
