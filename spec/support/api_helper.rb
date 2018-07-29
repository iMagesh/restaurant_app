module APIHelpers

  # Helper for API responses

  # Method to return response status
  def status
    response.status
  end

  # Method to return response content type
  def content_type
    response.content_type
  end

  # Method to format API response as JSON
  def json
    JSON.parse(response.body)
  end

  # Method to expect JSON content type
  def expect_json_content
    expect(content_type).to eq('application/json')
  end

  # Method to expect success HTTP status and JSON type
  def expect_success_status
    is_expected.to respond_with 200
  end

  # Method to expect forbidden HTTP status
  def expect_forbidden_status
    is_expected.to respond_with 403
  end

  # Method to expect unprocessable entity HTTP status
  def expect_unprocessable_status
    is_expected.to respond_with 422
  end

  # Method to expect Internal server error HTTP status
  def expect_server_error_status
    is_expected.to respond_with 500
  end

end