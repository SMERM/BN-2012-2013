module Betta
  class Nota
    attr_accessor :at, :dur, :strumento, :amp, :freq

    def initialize(at=0, dur=1, freq=440, amp=-18, strumento=1)
      @freq=freq
      @at=at
      @dur=dur
      @strumento=strumento
      @amp=-(amp.abs)
      Nota.registratore(self)
    end
  
    def to_csound
      sprintf("i%02d %8.4f %8.4f %+8.4f %8.4f",  @strumento, @at, @dur, @amp, @freq)  
    end

    @@note=[]

    def Nota.registratore(n)
      @@note << n
    end

    def Nota.play
      @@note
    end

    def Nota.clear
      @@note=[]
    end
  end
end