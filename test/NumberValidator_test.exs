defmodule NumberValidatorTest do
  use ExUnit.Case
  test "return false if a number is a prefix of another number in the list" do
    currentPhoneNumber = "911"
    phoneNumberList = ["911", "91125426", "97625992" ]
    assert NumberValidator.isPrefix(currentPhoneNumber, phoneNumberList) == false
  end
  
  test "return true if a number is not a prefix of any other numbers in the list" do
    currentPhoneNumber = "0231"
    phoneNumberList = ["0231", "91125426", "97625992" ]
    assert NumberValidator.isPrefix(currentPhoneNumber, phoneNumberList) == true
  end

  test "return true for a consistent list of phone numbers" do
    phoneNumberList = [ "0392987230", "0322659094", "037582951032", "00594833493" ]
    assert NumberValidator.validate(phoneNumberList) == true
  end
  
  test "return false for an inconsistent list of phone numbers" do
    phoneNumberList = ["911", "91125426", "97625992" ]
    assert NumberValidator.validate(phoneNumberList) == false
  end
  
  test "return false for an inconsistent list of phone numbers with mixed up order" do
    phoneNumberList = ["91125426", "911", "97625992" ]
    assert NumberValidator.validate(phoneNumberList) == false
  end
end
