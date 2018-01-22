defmodule PhoneBookReader do
  def convertToContactMaps (path) do
    File.stream!(path) |> CSV.decode!(headers: true) |> Enum.to_list
  end

  def getPhoneNumber (contactTuples) do
    Enum.map(contactTuples, fn (contact) -> String.replace(contact["Phone Number"], "-", "") |> String.replace(" ", "") end)
  end

  def verify ([head | tail]) do
    case Enum.all?(tail, fn(current) -> !String.contains?(current, head) end) do
      true -> verify(tail)
      false -> false
    end
  end

  def verify([]) do
    true
  end
end
