class RC4
    
      
       def initialize(key)
           @key = key.split()
           @S = Array.new
           
           for i in 0..255
            @S[i] = i
            end
           
       end
   
    private
    
    def ksa
       j = 0
       for i in 0..255
            j = (j + @S[i] + @key[i % key.length])
        end
    end
    
end

enc = RC4.new("EB9F7781B734CA72A719")



