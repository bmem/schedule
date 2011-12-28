require 'test_helper'

module Schedule
  class PersonTest < ActiveSupport::TestCase
    test "validates presence" do
      assert Person.new.invalid?, "Empty person was valid"
      assert Person.new(:name => "Ford Prefect").valid?,
        "Named person was invalid"
      assert Person.new(:name => "").invalid?, "Empty name was valid"
      assert Person.new(:name => " \n ").invalid?, "Whitespace name was valid"
    end
  end
end
