class RC4

  def initialize(str)
    @i, @j = 0 , 0

    ini_state(str)
  end

  def getbytes(numHex)
    numHex.times do
      @i = (@i + 1) % 256
      @j = (@j+ @S[@i]) % 256
     
      @S[@i], @S[@j] = @S[@j], @S[@i]
      
      puts @S[(@S[@i]+@S[@j])%256].to_s(16)
    end

  end



  private

  STATE = (0..255).to_a

  def ini_state(key)

    @S = STATE.dup

    j = 0
    
    for i in 0..255
      j = (j + @S[i] + key.getbyte(i % key.length)) % 256
      
      @S[i],@S[j] = @S[j],@S[i]
    end
  end

end





