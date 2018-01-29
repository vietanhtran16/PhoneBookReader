defmodule PhoneBookReader do
  import PhoneBookExtractor
  def verify(path) do
    PhoneBookExtractor.convertToContactMaps(path)
    |> PhoneBookExtractor.getPhoneNumber()
    |> PhoneBookReader.validate()
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