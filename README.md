PhoneNumber Kata
To verify a txt file of phone number, run this:
PhoneBookReader.convertToContactMaps(File.cwd! <> "/test/phone_data.txt") |> PhoneBookReader.getPhoneNumber |> PhoneBookReader.verify