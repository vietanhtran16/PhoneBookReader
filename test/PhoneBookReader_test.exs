defmodule PhoneBookReaderTest do
  use ExUnit.Case
  test "get cleansed Phone Number from contact tuples" do
    expected = [ "0392987230", "0322659094", "037582951032", "00594833493"]
    contactTuples = [%{"Name" => "Kimberlee Turlington", "Phone Number" => "039 298-72-30"},
                     %{"Name" => "Miguel Eveland", "Phone Number" => "032-2659094"},
                     %{"Name" => "Audrie Smid", "Phone Number" => "03758295-10 32"},
                     %{"Name" => "Antonia Maslanka", "Phone Number" => "00594-83-34 93"}]
    assert PhoneBookReader.getPhoneNumber(contactTuples) == expected
  end

  test "return false if a number is a prefix of another number in the list" do
    currentPhoneNumber = "911"
    phoneNumberList = ["911", "91125426", "97625992" ]
    assert PhoneBookReader.isValidNumber(currentPhoneNumber, phoneNumberList) == false
  end
  
  test "return true if a number is not a prefix of any other numbers in the list" do
    currentPhoneNumber = "0231"
    phoneNumberList = ["0231", "91125426", "97625992" ]
    assert PhoneBookReader.isValidNumber(currentPhoneNumber, phoneNumberList) == true
  end

  test "return true for a consistent list of phone numbers" do
    phoneNumberList = [ "0392987230", "0322659094", "037582951032", "00594833493" ]
    assert PhoneBookReader.validate(phoneNumberList) == true
  end
  
  test "return false for an inconsistent list of phone numbers" do
    phoneNumberList = ["911", "91125426", "97625992" ]
    assert PhoneBookReader.validate(phoneNumberList) == false
  end
  
  test "return false for an inconsistent list of phone numbers with mixed up order" do
    phoneNumberList = ["91125426", "911", "97625992" ]
    assert PhoneBookReader.validate(phoneNumberList) == false
  end
end
