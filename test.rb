require 'minitest/autorun'
# require 'minitest/reporters'
# Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative 'number_summary'

class NumberSummaryTest < MiniTest::Test

end

module NumberSummaryTests

	class Max < NumberSummaryTest
		def test_finds_the_max
			assert_equal 5, NumberSummary.max([1, 2, 3, 4, 5])
			assert_equal 4, NumberSummary.max([1, 4, 3, 2])
			assert_equal 3, NumberSummary.max([3, 2, 1])
			assert_equal 4, NumberSummary.max([4, 1, 4, 4])
			assert_equal 1, NumberSummary.max([1])
		end
	end

	class Min < NumberSummaryTest
		def test_finds_the_min
			assert_equal 1, NumberSummary.min([1, 2, 3, 4, 5])
			assert_equal 1, NumberSummary.min([4, 3, 1, 2])
			assert_equal 1, NumberSummary.min([3, 2, 1])
			assert_equal 4, NumberSummary.min([4, 5, 4, 4])
			assert_equal 1, NumberSummary.min([1])
		end
	end

	class Mean < NumberSummaryTest
		def test_finds_the_mean
			assert_equal (1+2+3+4+5)/5.0, NumberSummary.mean([1, 2, 3, 4, 5])
			assert_equal 10, NumberSummary.mean([10])
			assert_equal 3.0, NumberSummary.mean([3.5, 2.5])
			assert_equal 0.5, NumberSummary.mean([4, -10, 4, 4])
		end
	end

	class Median < NumberSummaryTest
		def test_ordered_list
			assert_equal 3.0, NumberSummary.median([1, 2, 3, 4, 5])
		end

		def test_returns_float_when_list_is_odd
			assert_equal Float, NumberSummary.median([1, 2, 3, 4, 5]).class
		end

		def test_single_item
			assert_equal 2, NumberSummary.median([2])
		end

		def test_even_list
			assert_equal 3.5, NumberSummary.median([1, 2, 3, 4, 5, 6])
		end

		def test_returns_float_when_list_is_even
			assert_equal Float, NumberSummary.median([4, 5, 5, 7]).class
		end

		def test_unordered_list
			assert_equal 3.0, NumberSummary.median([2, 5, 1, 3, 4])
			assert_equal 3.5, NumberSummary.median([2, 5, 1, 3, 4, 6])
		end
	end

	class Quartile1 < NumberSummaryTest
		def test_ordered_list
			assert_equal 1.5, NumberSummary.q1([1, 2, 3, 4, 5])
		end

		def test_returns_float_when_list_is_odd
			assert_equal Float, NumberSummary.q1([1, 2, 3, 4, 5]).class
		end

		def test_triplet
			assert_equal 1, NumberSummary.q1([2, 1, 3])
		end

		def test_even_list
			assert_equal 2, NumberSummary.q1([1, 2, 3, 4, 5, 6])
		end

		def test_returns_float_when_list_is_even
			assert_equal Float, NumberSummary.q1([4, 4, 5, 7]).class
		end

		def test_unordered_list
			assert_equal 1.5, NumberSummary.q1([2, 5, 1, 3, 4])
			assert_equal 2, NumberSummary.q1([2, 5, 1, 3, 4, 6])
		end
	end

	class Quartile3 < NumberSummaryTest
		def test_ordered_list
			assert_equal 4.5, NumberSummary.q3([1, 2, 3, 4, 5])
		end

		def test_returns_float_when_list_is_odd
			assert_equal Float, NumberSummary.q3([1, 2, 3, 4, 5]).class
		end

		def test_triplet
			assert_equal 3, NumberSummary.q3([3, 1, 2])
		end

		def test_even_list
			assert_equal 5, NumberSummary.q3([1, 2, 3, 4, 5, 6])
		end

		def test_returns_float_when_list_is_even
			assert_equal Float, NumberSummary.q3([1, 2, 5, 5]).class
		end

		def test_unordered_list
			assert_equal 4.5, NumberSummary.q3([2, 5, 1, 3, 4])
			assert_equal 5, NumberSummary.q3([2, 5, 1, 3, 4, 6])
		end
	end

	class Mode < NumberSummaryTest
		def test_no_repeats
			assert_equal [1, 2, 3, 4, 5, 6], NumberSummary.mode([1, 2, 3, 4, 5, 6])
		end

		def results_are_sorted
			assert_equal [1, 2, 3, 4, 5, 6], NumberSummary.mode([2, 5, 1, 3, 4, 6])
		end

		def test_finds_a_single_mode
			assert_equal [2], NumberSummary.mode([2, 1, 2])
			assert_equal [2], NumberSummary.mode([1, 2, 2])
			assert_equal [2], NumberSummary.mode([2, 2, 1])
		end

		def test_finds_multiple_modes
			assert_equal [1, 2], NumberSummary.mode([2, 1, 2, 1])
			assert_equal [0, 1, 2], NumberSummary.mode([1, 2, 2, 0, 1, 5, 0])
			assert_equal [0, 2], NumberSummary.mode([2, 2, 1, 0, 0])
		end
	end

	class Sigma < NumberSummaryTest
		def test_regular_numbers
			assert_in_delta 1.8708, NumberSummary.sigma([1, 2, 3, 4, 5, 6]), 0.1
		end

		def test_regular_unordered_numbers
			assert_in_delta 1.8708, NumberSummary.sigma([5, 3, 1, 6, 4, 2]), 0.1
		end

		def test_normal_distribution
			d = [67.263, 91.912, -1.201, 33.214, 39.97, 
					 59.335, 8.876, 48.421, 81.62, 117.218]
			assert_in_delta 36.72726, NumberSummary.sigma(d), 0.1
		end
	end

	class Summary < NumberSummaryTest
		def test_summarizes_a_file
			summary = '''Number Summary:
min: -9.45
max: 4.99
mean: -2.4
median: -3.9
q1: -5.5
q3: 1.6
mode: [-4.73, 1.59]
sigma: 4.8
'''
			assert_equal summary, NumberSummary.summarize('data.csv')
		end
	end

end