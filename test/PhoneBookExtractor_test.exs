defmodule PhoneBookExtractorTest do
  use ExUnit.Case
  test "get cleansed Phone Number from contact tuples" do
    expected = [ "0392987230", "0322659094", "037582951032", "00594833493"]
    contactTuples = [%{"Name" => "Kimberlee Turlington", "Phone Number" => "039 298-72-30"},
                     %{"Name" => "Miguel Eveland", "Phone Number" => "032-2659094"},
                     %{"Name" => "Audrie Smid", "Phone Number" => "03758295-10 32"},
                     %{"Name" => "Antonia Maslanka", "Phone Number" => "00594-83-34 93"}]
    assert PhoneBookExtractor.getPhoneNumber(contactTuples) == expected
  end
end
