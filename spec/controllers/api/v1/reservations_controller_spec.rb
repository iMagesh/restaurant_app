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
          reservation_from: "11am",
          reservation_to: "12pm"
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
      expect(from_time).to match("11am")
      expect(to_time).to match("12pm")
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


  context 'Update Reservation details' do


    before(:example) do
      @res = FactoryGirl.create(:reservation)
    end

    it 'responds with a 200 status code' do
      params = {
        id: @res.id,
        reservation: {
          reservation_from: "11am",
          reservation_to: "12pm"
        }
      }
      patch :update, params, format: 'json'
      is_expected.to respond_with 200
      expect(response.content_type).to eq "application/json"

    end

    it 'it should contain the updated reservation time' do
      params = {
        id: @res.id,
        reservation: {
          reservation_from: "11am",
          reservation_to: "12pm"
        }
      }
      patch :update, params, format: 'json'
      from_time = json['reservation_from'].to_datetime.strftime("%l%P")
      to_time = json['reservation_to'].to_datetime.strftime("%l%P")
      expect(from_time).to match("11am")
      expect(to_time).to match("12pm")
    end

    it 'it should contain the updated guests count' do
      params = {
        id: @res.id,
        reservation: {
          guests_count: 6
        }
      }
      patch :update, params, format: 'json'
      expect(json['guests_count']).to match(6)
    end

  end

  context "List reservations for a given restaurant" do

    before(:example) do
      r = FactoryGirl.create(:reservation)
      get :index, id: r.restaurant_table.restaurant.id, format: 'json'
    end

    it "should contain a array of reservations data" do
      expect(json).not_to be_empty
    end

    it "should contain the right set of information" do
      expect(json['reservations'][0].keys).to include(
        "guest_name", "guests_count", "table_name", "reservation_time"
      )
    end

  end



end