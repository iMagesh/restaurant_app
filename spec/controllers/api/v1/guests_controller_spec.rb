describe Api::V1::GuestsController do
  # test "the truth" do
  #   assert true
  # end

  context 'Create Guest' do
    let(:params) do
      {
        guest: {
          name: "Magesh",
          email: "test@magesh.com"
        }
      }
    end

    before(:example) do
      post :create, params, format: 'json'
    end

    it 'responds with a 200 status code' do
      is_expected.to respond_with 200
    end

    it 'returns json' do
      expect(response.content_type).to eq "application/json"

    end

    it 'it shoud contain the guest data' do
      # expect(json).to include(
      #   {
      #     "name": "Magesh",
      #     "email": "test@magesh.com"
      #   }
      # )
      expect(json.keys).to include('id', 'name', 'email')
      expect(json['name']).to match("Magesh")
      expect(json['email']).to match("test@magesh.com")
    end
  end

  context "when name or email is missing" do
    let(:params) do
      {
        guest: {
          name: "Magesh"
        }
      }
    end

    it "should render error messages for email" do
      post :create, params
      expect_forbidden_status
      expect_json_content
      expect(json["error"]).to eq(true)
      expect(json["errors"]).to include(
        "Email can't be blank")
    end

    it "should render error messages for missing name" do
      post :create, {guest: {email: "test@magesh.com"}}
      expect_forbidden_status
      expect_json_content
      expect(json["error"]).to eq(true)
      expect(json["errors"]).to include(
        "Name can't be blank")
    end

  end

end