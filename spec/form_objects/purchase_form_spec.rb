RSpec.describe PurchaseForm, type: :service do
  let!(:user) { create :user }
  let!(:movie) { create :movie }
  let!(:tv_show) { create :movie }
  let!(:season) { create :season, movie: tv_show }

  describe '.persist?' do
    context 'for unexisted purchaseable' do
      let(:service) { PurchaseForm.new(purchaseable_id: 999, purchaseable_type: 'Movie') }

      it 'returns false' do
        expect(service.persist?).to eq false
      end
    end

    context 'for can not be purchased' do
      let(:service) { PurchaseForm.new(purchaseable_id: tv_show.id, purchaseable_type: 'Movie') }

      it 'returns false' do
        expect(service.persist?).to eq false
      end
    end

    context 'for existed active purchase' do
      let!(:purchase) { create :purchase, user: user, purchaseable_id: movie.id, purchaseable_type: 'Movie' }
      let(:service) { PurchaseForm.new(purchaseable_id: tv_show.id, purchaseable_type: 'Movie') }

      it 'returns false' do
        expect(service.persist?).to eq false
      end
    end

    context 'for invalid data' do
      let(:service) { PurchaseForm.new(purchaseable_id: tv_show.id, purchaseable_type: 'Movie', user: user, video_quality: 'Cool') }

      it 'returns false' do
        expect(service.persist?).to eq false
      end
    end

    context 'for existed active purchase' do
      let!(:purchase) { create :purchase, user: user, purchaseable_id: movie.id, purchaseable_type: 'Movie' }
      let(:service) { PurchaseForm.new(purchaseable_id: movie.id, purchaseable_type: 'Movie', user: user) }

      it 'returns false' do
        expect(service.persist?).to eq false
      end
    end

    context 'for existed active purchase' do
      let!(:purchase) { create :purchase, user: user, purchaseable_id: movie.id, purchaseable_type: 'Movie' }
      let(:service) { PurchaseForm.new(purchaseable_id: movie.id, purchaseable_type: 'Movie', user: user, video_quality: 'HD') }
      before { purchase.update(created_at: purchase.created_at - 3.days) }

      it 'returns true' do
        expect(service.persist?).to eq true
      end
    end
  end
end
