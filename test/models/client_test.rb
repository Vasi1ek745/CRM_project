require "test_helper"

class ClientTest < ActiveSupport::TestCase
  
  test "client_without_name" do
    c = Client.new(name:"12345")
   assert_not c.save

  end

end
