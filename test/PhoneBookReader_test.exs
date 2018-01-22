defmodule PhoneBookReaderTest do
  use ExUnit.Case
  test "get list of contact tuples" do
    expected = [%{"Name" => "Kimberlee Turlington", "Phone Number" => "039 298-72-30"},
                %{"Name" => "Miguel Eveland", "Phone Number" => "032-2659094"},
                %{"Name" => "Audrie Smid", "Phone Number" => "03758295-10 32"},
                %{"Name" => "Antonia Maslanka", "Phone Number" => "00594-83-34 93"},
                %{"Name" => "Val Hoffmeyer", "Phone Number" => "001-859-07-84"},
                %{"Name" => "Fleta Mckiney", "Phone Number" => "046-30-01-80"},
                %{"Name" => "Leanna Wedel", "Phone Number" => "0184 425384"},
                %{"Name" => "Reva Larger", "Phone Number" => "0262-2875"},
                %{"Name" => "Shelby Prator", "Phone Number" => "0174-1599"},
                %{"Name" => "Micheal Veronesi", "Phone Number" => "09564 310-6 4"}]
    assert PhoneBookReader.convertToContactMaps(File.cwd! <> "/test/phone_data_small_set.txt") == expected
  end

  test "get cleansed Phone Number from contact tuples" do
    expected = [ "0392987230", "0322659094", "037582951032", "00594833493"]
    contactTuples = [%{"Name" => "Kimberlee Turlington", "Phone Number" => "039 298-72-30"},
                     %{"Name" => "Miguel Eveland", "Phone Number" => "032-2659094"},
                     %{"Name" => "Audrie Smid", "Phone Number" => "03758295-10 32"},
                     %{"Name" => "Antonia Maslanka", "Phone Number" => "00594-83-34 93"}]
    assert PhoneBookReader.getPhoneNumber(contactTuples) == expected
  end

  test "return true for a consistent list of phone numbers" do
    phoneNumberList = [ "0392987230", "0322659094", "037582951032", "00594833493" ]
    assert PhoneBookReader.verify(phoneNumberList) == true
  end
  
  test "return false for an inconsistent list of phone numbers" do
    phoneNumberList = ["911", "91125426", "97625992" ]
    assert PhoneBookReader.verify(phoneNumberList) == false
  end
end
