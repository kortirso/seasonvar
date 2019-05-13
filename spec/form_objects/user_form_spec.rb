RSpec.describe UserForm, type: :service do
  let!(:user_params) { { email: 'email@gmail.com', password: '1234567890' } }

  describe '.persist?' do
    context 'for invalid data' do
      let(:service) { UserForm.new(email: '', password: '') }

      it 'returns false' do
        expect(service.persist?).to eq false
      end
    end

    context 'for existed user' do
      let!(:user) { create :user, email: 'email@gmail.com' }
      let(:service) { UserForm.new(user_params) }

      it 'returns false' do
        expect(service.persist?).to eq false
      end
    end

    context 'for valid data' do
      let!(:service) { UserForm.new(user_params) }

      it 'creates new user' do
        expect { service.persist? }.to change { User.count }.by(1)
      end

      it 'and returns new user' do
        service.persist?

        expect(service.user).to eq User.last
      end
    end
  end
end
