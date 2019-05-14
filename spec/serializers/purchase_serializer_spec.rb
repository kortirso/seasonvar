RSpec.describe PurchaseSerializer do
  let!(:purchase) { create :purchase }
  let(:serializer) { described_class.new(purchase).to_json }

  %w[id purchaseable_id purchaseable_type created_at].each do |attr|
    it "serializer contains purchase #{attr}" do
      expect(serializer).to have_json_path(attr)
    end
  end
end
