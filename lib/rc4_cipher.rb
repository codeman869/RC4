class RC4

  attr_reader :key

  def initialize(str)
    @i, @j = 0 , 0

    ini_state(str)
  end


  def encrypt!(text)
    n = 0
    while n < text.length
      
      text.setbyte(n,key.next ^ text.getbyte(n))
      n = n.next
    end
    text
  end

  alias_method :decrypt!, :encrypt!


  private

  STATE = (0..255).to_a

  def ini_state(key)

    @S = STATE.dup

    j = 0
    
    for i in 0..255
      j = (j + @S[i] + key.getbyte(i % key.length)) % 256
      
      @S[i],@S[j] = @S[j],@S[i]
    end

    @key = Enumerator.new do |k|
      while true
        @i = (@i + 1) % 256
        @j = (@j+ @S[@i]) % 256
     
        @S[@i], @S[@j] = @S[@j], @S[@i]
      
        k.yield @S[(@S[@i]+@S[@j])%256]
      end
    end

  end

end





