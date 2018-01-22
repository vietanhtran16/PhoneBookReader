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
    assert PhoneBookReader.convertToContactMaps("c:/Projects/phonenumberkata/test/phone_data_small_set.txt") == expected
  end

  test "get only Phone Number from contact tuples" do
    expected = [ "039 298-72-30", "032-2659094", "03758295-10 32", "00594-83-34 93"]
    contactTuples = [%{"Name" => "Kimberlee Turlington", "Phone Number" => "039 298-72-30"},
                     %{"Name" => "Miguel Eveland", "Phone Number" => "032-2659094"},
                     %{"Name" => "Audrie Smid", "Phone Number" => "03758295-10 32"},
                     %{"Name" => "Antonia Maslanka", "Phone Number" => "00594-83-34 93"}]
    assert PhoneBookReader.getPhoneNumber(contactTuples) == expected
  end
end
