require "generatore_base"
require "nota"
class GeneratoreRandom < GeneratoreBase
  
  def genera
    risultato=[]
    1.upto(self.num) do #num è un metodo di lettura
      at = rand()*100
      dur = rand()*10
      freq = rand()*1000+100
      amp = rand()*50+10
      risultato << Nota.new(freq,at,dur,1,amp)
    end
    
    risultato
  end
end
