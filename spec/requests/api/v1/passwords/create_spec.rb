describe 'POST api/v1/users/password', type: :request do
  subject { post user_password_path, params: params, as: :json }

  let!(:user) { create(:user, password: 'mypass123') }

  context 'with valid params' do
    let(:params) { { email: user.email } }

    it 'returns a successful response' do
      subject
      expect(response).to have_http_status(:success)
    end

    it 'returns the user email' do
      subject
      expect(json[:message]).to match(/#{user.email}/)
    end

    it 'sends an email' do
      expect { subject }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end

  context 'with invalid params' do
    let(:params) { { email: 'notvalid@example.com' } }

    it 'does not return a successful response' do
      subject
      expect(response.status).to eq(404)
    end

    it 'does not send an email' do
      expect { subject }.to change { ActionMailer::Base.deliveries.count }.by(0)
    end
  end
end
