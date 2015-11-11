module PFE
  class PrimeForm
    
    attr_reader :name, :vector, :normal_form
    
    def initialize(line)
      (@name, nf, @vector) = line.split('|')
      @normal_form = nf.split(',').map { |n| n.to_i }
      @name.strip!
      @vector.strip!
    end
    
    def cardinality
      self.name.split('-').first.to_i
    end
    
    def ordinality
      self.name.split('-').last
    end
    
    def key
      self.normal_form.to_s
    end
    
  end
end