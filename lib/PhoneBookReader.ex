defmodule PhoneBookReader do
  import PhoneBookExtractor
  import NumberValidator
  def verify(path) do
    PhoneBookExtractor.convertToContactMaps(path)
      |> PhoneBookExtractor.getPhoneNumber()
      |> NumberValidator.validate()
  end
end