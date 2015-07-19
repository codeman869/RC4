require 'rspec'
require 'rc4_cipher'

describe RC4 do 

	before :each do 
		@crypto = RC4.new("Secret")
	end

	describe "#new" do
		it "takes a single string parameter and should return an instance of RC4" do
			expect(@crypto).to be_an_instance_of RC4
		end

		it "raises an argument error when initialized without a key" do
			expect {RC4.new}.to raise_error(ArgumentError)
		end
	end
	
	describe "#key" do
		it "returns numbers from the pseudorandom number generator" do
			#test obtained from Wikipedia
			output = ""
			8.times do
				output << ("%02X" % @crypto.key.next)
			end
			expect(output).to eql "04D46B053CA87B59"

		end
	end

	describe "#encrypt!" do
		it "returns an encrypted text string from a string of text" do
			output = "Attack at dawn"
			@crypto.encrypt!(output)
			hex_output = ""
			for i in 0...output.length
				hex_output << ("%02X" % output.getbyte(i))
			end
			expect(hex_output).to eql "45A01F645FC35B383552544B9BF5"

		end

	end

	describe "#decrypt!" do
		it "returns a decrypted text string from a string of encrypted text" do
			output = "Attack at dawn"
			@crypto.encrypt!(output)
			decrypter = RC4.new("Secret")
			decrypter.decrypt!(output)
			
			expect(output).to eql "Attack at dawn"

		end

	end


end