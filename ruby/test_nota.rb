require 'helper'

class TestNota < Test::Unit::TestCase

  should "creare la nota con parametri di default" do
    assert n=Betta::Nota.new
    assert_equal 0, n.at
    assert_equal 1, n.dur
    assert_equal 440, n.freq
    assert_equal -18, n.amp
    assert_equal 1. n.strumento
    assert_equal 'i01   0.0000   1.0000 -18.0000 440.0000', n.to_csound
  end
  
  should "creare la nota con parametri dati" do
    assert n=Betta::Nota.new(1, 2, 1880, -6, 2)
    assert_equal 1, n.at
    assert_equal 2, n.dur
    assert_equal 1880, n.freq
    assert_equal -6, n.amp
    assert_equal 2, n.strumento
    assert_equal 'i02   1.0000   2.0000  -6.0000 1880.0000', n.to_csound
  end

  should "contare il numero di note create" do
    assert_num_note=23
    assert_equal 0, Betta::Nota.play.size
    1.upto(num_note) { |n| assert nota=Betta::Nota.new(n) }
    assert_equal num_note, Betta::Nota.play.size
    assert Betta::Nota.clear
    assert_equal 0, Betta::Nota.play.size
  end

end