defmodule NumberValidator do
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