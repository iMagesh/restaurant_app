describe Api::V1::RestaurantsController do
  # test "the truth" do
  #   assert true
  # end

  context 'Create Restaurant' do
    let(:params) do
      {
        restaurant: {
          name: "Orange wok",
          email: "sales@orangewok.com",
          phone: "9952031234"
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

    it 'it shoud contain the restaurant data' do
      # expect(json).to include(
      #   {
      #     "name": "Magesh",
      #     "email": "test@magesh.com"
      #   }
      # )
      expect(json.keys).to include('id', 'name', 'email', 'phone')
      expect(json['name']).to match("Orange wok")
      expect(json['email']).to match("sales@orangewok.com")
      expect(json['phone']).to match("9952031234")
    end
  end

  context "when name or email is missing" do
    let(:params) do
      {
        restaurant: {
          name: "Magesh"
        }
      }
    end

    it "should render error messages for missing email" do
      post :create, params
      expect_forbidden_status
      expect_json_content
      expect(json["error"]).to eq(true)
      expect(json["errors"]).to include(
        "Email can't be blank")
    end

    it "should render error messages for missing name and phone" do
      post :create, {restaurant: {email: "sales@orangewok.com"}}
      expect_forbidden_status
      expect_json_content
      expect(json["error"]).to eq(true)
      expect(json["errors"]).to include(
        "Name can't be blank", "Phone can't be blank")
    end

    it "should render error messages for invalid email" do
      post :create, {restaurant: {email: "testmagesh.com"}}
      expect_forbidden_status
      expect_json_content
      expect(json["error"]).to eq(true)
      expect(json["errors"]).to include(
        "Email is invalid")
    end

    it "should render error messages for invalid phone with alphabet" do
      post :create, {restaurant: {email: "something@gmail.com", phone: "A919952031234"}}
      expect_forbidden_status
      expect_json_content
      expect(json["error"]).to eq(true)
      expect(json["errors"]).to include(
        "Phone is not a number")
    end

    it "should render error messages for wrong phone number format" do
      post :create, {restaurant: {email: "something@gmail.com", phone: "00066919952031234"}}
      expect_forbidden_status
      expect_json_content
      expect(json["error"]).to eq(true)
      expect(json["errors"]).to include(
        "Phone is too long")
    end

  end

end