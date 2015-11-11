require 'test/unit'
require 'pfe'

class PrimeFormTest < Test::Unit::TestCase
  
  def test_create
    assert input = '3-1 | 0, 1, 2 | 200000'
    assert pf = PFE::PrimeForm.new(input)
    assert_equal 3, pf.cardinality
    assert_equal '[0, 1, 2]', pf.key
    assert_equal [0, 1, 2], pf.normal_form
    assert_equal '1', pf.ordinality
    assert_equal '200000', pf.vector
    
  end
    
end