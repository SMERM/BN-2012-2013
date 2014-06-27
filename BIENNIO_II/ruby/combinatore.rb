require 'fact'

class Combinatore < Array
  attr_reader :sottogruppo

  def num_di_permutazioni
    Math.fact(self.size)/(Math.fact(self.size-self.sottogruppo))
  end

  def initialize(s, a=[])
    super(a)
    @sottogruppo = s
  end

  def swap!(a, b)
    left = self[a]
    right = self[b]
    self[b] = left
    self[a] = right
    self
  end

  def permuta
    sub = self[0..self.sottogruppo-1]
  end

  def permuta_ricorsivo(sub, da, a, res)
    if(a > da)
      for (k = a; k >= da; k−−)
        self.swap!(sub, k, a)
        res << sub
        permuta_ricorsivo(sub, da, a−1, res)
        self.swap!(sub, k, a)
        res << sub
      end
    end
    
    res
    
  end
  
end