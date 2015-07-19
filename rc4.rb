class RC4

  def initialize(key)
    @key = key
    @S = Array.new

    for i in 0..255
      @S[i] = i
    end

    ksa
  end

  def gen(numHex)
    i = 0
    j = 0

    numHex.times do
      i = (i + 1) % 256
      j = (j+ @S[i]) % 256
     
      @S[i], @S[j] = @S[j], @S[i]
      
      puts @S[(@S[i]+@S[j])%256].to_s(16)
    end

  end

  private

  STATE = (0..255).to_a

  def ksa
    j = 0
    
    for i in 0..255
      j = (j + @S[i] + @key.getbyte(i % @key.length)) % 256
      
      @S[i],@S[j] = @S[j],@S[i]
    end
  end

end




test = RC4.new("Secret")

test.gen(8)



