describe Api::V1::ReservationsController do
  # test "the truth" do
  #   assert true
  # end

  context 'Create Reservation' do


    before(:example) do
      @res = FactoryGirl.create(:restaurant_with_tables_and_shifts)

      params = {
        reservation: {
          restaurant_table_id: RestaurantTable.last.id,
          guests_count: 4,
          restaurant_shift_id: RestaurantShift.last.id,
          guest_email: "something@gmail.com",
          guest_name: "Something",
          reservation_from: "9am",
          reservation_to: "10am"
        }
      }

      post :create, params, format: 'json'
    end

    it 'responds with a 200 status code' do
      is_expected.to respond_with 200
    end

    it 'returns json' do
      expect(response.content_type).to eq "application/json"
    end

    it 'it shoud contain the reservation data' do
      expect(json.keys).to include('id', 'restaurant_table_id', 'guests_count', 'restaurant_shift_id', 'guest_id', 'reservation_from', 'reservation_to')
      expect(json['restaurant_table_id']).to match(@res.restaurant_tables.last.id)
      expect(json['restaurant_shift_id']).to match(@res.restaurant_shifts.last.id)
      expect(json['guests_count']).to match(4)
      email = Guest.find(json['guest_id']).email
      expect(email).to match("something@gmail.com")
    end

    it 'it should contain the correct reservation time' do
      from_time = json['reservation_from'].to_datetime.strftime("%l%P")
      to_time = json['reservation_to'].to_datetime.strftime("%l%P")
      expect(from_time).to match("9am")
      expect(to_time).to match("10am")
    end

  end

  context "When params doesn't contain all required details" do

    it "it should throw validation message when guest count exceeds the capacity of table" do
      @res = FactoryGirl.create(:restaurant_with_tables_and_shifts)

      params = {
        reservation: {
          restaurant_table_id: RestaurantTable.last.id,
          guests_count: 11,
          restaurant_shift_id: RestaurantShift.last.id,
          guest_email: "something@gmail.com",
          guest_name: "Something",
          reservation_from: "9am",
          reservation_to: "10am"
        }
      }

      post :create, params, format: 'json'
      expect(json["error"]).to eq(true)
      expect(json["errors"]).to include(
        "Reservation Guest count doesn't match with table requirement")
    end

    it "it should throw validation message when reservation time doesn't match with the restaurant shift" do
      @res = FactoryGirl.create(:restaurant_with_tables_and_shifts)
      FactoryGirl.create(:restaurant_shift, name: "evening", start_time: "4pm", end_time: "8pm")

      params = {
        reservation: {
          restaurant_table_id: RestaurantTable.last.id,
          guests_count: 4,
          restaurant_shift_id: RestaurantShift.last.id,
          guest_email: "something@gmail.com",
          guest_name: "Something",
          reservation_from: "9am",
          reservation_to: "10am"
        }
      }

      post :create, params, format: 'json'
      expect(json["error"]).to eq(true)
      expect(json["errors"]).to include(
        "Reservation time slot is out of restaurant shift")
    end

  end


  # context "when name or email is missing" do
  #   let(:params) do
  #     {
  #       restaurant: {
  #         name: "Magesh"
  #       }
  #     }
  #   end

  #   it "should render error messages for missing email" do
  #     post :create, params
  #     expect_forbidden_status
  #     expect_json_content
  #     expect(json["error"]).to eq(true)
  #     expect(json["errors"]).to include(
  #       "Email can't be blank")
  #   end

  #   it "should render error messages for missing name and phone" do
  #     post :create, {restaurant: {email: "sales@orangewok.com"}}
  #     expect_forbidden_status
  #     expect_json_content
  #     expect(json["error"]).to eq(true)
  #     expect(json["errors"]).to include(
  #       "Name can't be blank", "Phone can't be blank")
  #   end

  #   it "should render error messages for invalid email" do
  #     post :create, {restaurant: {email: "testmagesh.com"}}
  #     expect_forbidden_status
  #     expect_json_content
  #     expect(json["error"]).to eq(true)
  #     expect(json["errors"]).to include(
  #       "Email is invalid")
  #   end

  #   it "should render error messages for invalid phone with alphabet" do
  #     post :create, {restaurant: {email: "something@gmail.com", phone: "A919952031234"}}
  #     expect_forbidden_status
  #     expect_json_content
  #     expect(json["error"]).to eq(true)
  #     expect(json["errors"]).to include(
  #       "Phone is not a number")
  #   end

  #   it "should render error messages for wrong phone number format" do
  #     post :create, {restaurant: {email: "something@gmail.com", phone: "00066919952031234"}}
  #     expect_forbidden_status
  #     expect_json_content
  #     expect(json["error"]).to eq(true)
  #     expect(json["errors"]).to include(
  #       "Phone is too long")
  #   end

  # end

end