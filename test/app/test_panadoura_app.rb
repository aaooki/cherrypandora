require_relative '../test_helper'

class PanadouraTest < TestHelper
  def app
    ::Panadoura::Application
  end

  def test_api_unauthorized
    get '/api'

    assert last_response.status == 401
  end
end
