defmodule PhoneBookExtractor do
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
end