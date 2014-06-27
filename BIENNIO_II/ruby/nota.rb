class Nota
  attr_accessor :at, :dur, :strum, :amp

  def initialize(altezza,at,dur,strum,amp)
    @altezza=altezza
    @at=at
    @dur=dur
    @strum=strum
    @amp=-(amp.abs)
    Nota.registratore(self)
  end
  
  def to_csound
    printf("i%02d %8.4f %8.4f %+8.4f %8.4f\n",  @strum, @at, @dur, @amp, @altezza)  
  end

  def altezza
    @altezza
  end

  def altezza=(val)
    @altezza=val
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
