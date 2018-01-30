defmodule NumberValidator do
    def validate(phoneNumberList) do
        Enum.all?(phoneNumberList, fn current -> isPrefix(current, phoneNumberList) end)
    end
    
    def isPrefix(currentPhoneNumber, phoneNumberList) do
        listWithoutCurrentNumber = List.delete(phoneNumberList, currentPhoneNumber)
    
        Enum.all?(listWithoutCurrentNumber, fn current ->
          !String.starts_with?(current, currentPhoneNumber)
        end)
    end
end