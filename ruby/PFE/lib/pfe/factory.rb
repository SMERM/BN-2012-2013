require 'singleton'
require 'pfe'

module PFE
  class Factory
    include Singleton
    
    attr_reader :database
    
    def generate(a)
      nf = find_normal_form(a)
    end
    
    def initialize
      @database = {}
      read_database
    end
    
  private
  
    def find_normal_form(a)
      card = a.size
      perms = [a.sort]
      2.upto(card) do
        l = perms.last
        lr = l.rotate
        lr[lr.size-1] = lr.last + 12
        perms << lr
      end
      
    nt = perms.sort {|a,b| (a.last - a.first) <=> (b.last - b.first)}.first
    nt.map{|n| n-nt.first}
      
    end
  
    def read_database
      dbpath = File.expand_path('../../../data/prime_forms.data', __FILE__)
      File.open(dbpath, 'r') do
        |f|
        lines = f.readlines
        lines.each do
          |l|
          cline = l.chomp.sub(/\s*#.*$/, '')
          unless cline.empty?
            pf = PFE::PrimeForm.new(cline)
            self.database.update(pf.key => pf)
          end
        end
      end
    end
    
  end
end