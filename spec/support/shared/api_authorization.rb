shared_examples_for "API Authenticable" do
  context 'unauthorized' do
    it 'returns 401 status code if there is no access_token' do
      do_request
      expect(response.status).to eq 401
    end

    it 'returns 401 status code if access_token is invalid' do
      do_request(access_token: '123')
      expect(response.status).to eq 401
    end
  end
end