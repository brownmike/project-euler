require 'minitest/autorun'
require_relative 'phi'

class TestPhi < MiniTest::Test
  def test_relative_primes_works_with_small_prime
    assert_equal (1..6).to_a, 7.relative_primes
  end

  def test_relative_primes_works_with_small_number_with_few_relative_primes
    assert_equal [1, 5], 6.relative_primes
  end

  def test_phi_works_with_two
    assert_equal 1, 2.phi
  end

  def test_phi_works_with_three
    assert_equal 2, 3.phi
  end

  def test_phi_works_with_four
    assert_equal 2, 4.phi
  end

  def test_phi_works_with_five
    assert_equal 4, 5.phi
  end

  def test_phi_works_with_ten
    assert_equal 4, 10.phi
  end

  def test_n_to_phi_ratio_works_with_small_known_number
    assert_equal 3, 6.n_to_phi_ratio
  end

  def test_totient_maximum_returns_nil_for_limits_less_than_two
    assert_equal nil, totient_maximum(1)
  end

  def test_totient_maximum_works_for_small_known_limit
    assert_equal 6, totient_maximum(10)
  end
end
