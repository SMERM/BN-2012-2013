require 'test/unit'
require 'pfe'

class FactoryTest < Test::Unit::TestCase
  
  def test_singleton
    assert one = PFE::Factory.instance
    assert two = PFE::Factory.instance
    assert_equal one, two
    assert !PFE::Factory.respond_to?(:new)
  end
  
  def test_generate
    assert f = PFE::Factory.instance
    assert accordo = [0, 11, 3]
    assert pf = f.generate(accordo)
    assert_equal PFE::PrimeForm, pf.class
  end
  
  def test_find_normal_form
    assert f = PFE::Factory.instance
    assert t = [[[0, 11, 3], [0, 1, 4]]]
    t.each do
      |tt|
      assert test = tt[0]
      assert result = tt[1]
      assert_equal result, f.send(:find_normal_form, test)
    end
    
  end
  
end