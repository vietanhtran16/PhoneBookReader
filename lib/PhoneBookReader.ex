defmodule PhoneBookReader do
  def convertToContactMaps (path) do
    File.stream!(path) 
      |> CSV.decode!(headers: true) 
      |> Enum.to_list
  end

  def getPhoneNumber (contactTuples) do
    Enum.map(contactTuples, 
      fn (contact) -> String.replace(contact["Phone Number"], "-", "") 
                   |> String.replace(" ", "") end)
  end

  def isValidNumber(currentPhoneNumber, phoneNumberList) do 
    listWithoutCurrentNumber = List.delete(phoneNumberList, currentPhoneNumber)
    Enum.all?(listWithoutCurrentNumber, fn (current) -> !String.contains?(current, currentPhoneNumber) end)
  end

  def verify (phoneNumberList) do
    Enum.all?(phoneNumberList, fn(current) -> isValidNumber(current, phoneNumberList) end)
  end
end
