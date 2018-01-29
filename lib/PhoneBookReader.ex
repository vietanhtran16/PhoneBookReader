defmodule PhoneBookReader do
  import PhoneBookExtractor
  def verify(path) do
    PhoneBookExtractor.convertToContactMaps(path)
    |> PhoneBookExtractor.getPhoneNumber()
    |> PhoneBookReader.validate()
  end

  def convertToContactMaps(path) do
    File.stream!(path)
    |> CSV.decode!(headers: true)
    |> Enum.to_list()
  end

  def getPhoneNumber(contactTuples) do
    Enum.map(contactTuples, fn contact ->
      String.replace(contact["Phone Number"], "-", "")
      |> String.replace(" ", "")
    end)
  end

  def validate(phoneNumberList) do
    Enum.all?(phoneNumberList, fn current -> isPrefix(current, phoneNumberList) end)
  end

  def isPrefix(currentPhoneNumber, phoneNumberList) do
    listWithoutCurrentNumber = List.delete(phoneNumberList, currentPhoneNumber)

    Enum.all?(listWithoutCurrentNumber, fn current ->
      !String.contains?(current, currentPhoneNumber)
    end)
  end
end