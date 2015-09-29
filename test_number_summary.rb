require 'minitest/autorun'

require_relative 'number_summary'

class NumberSummaryTest < Minitest::Test

end

module NumberSummaryTests

	class Max < NumberSummaryTest
		def test_finds_the_max
			assert_equal 5, NumberSummary.max([1,2,3,4,5])
			assert_equal 4, NumberSummary.max([1,4,3,2])
			assert_equal 3, NumberSummary.max([1,2,3])
			assert_equal 4, NumberSummary.max([4,1,4,4])
			assert_equal 1, NumberSummary.max([1])
		end
	end

	class Min < NumberSummaryTest
		def test_finds_the_min
			assert_equal 1, NumberSummary.min([1,2,3,4,5])
			assert_equal 1, NumberSummary.min([4,3,1,2])
			assert_equal 1, NumberSummary.min([3,2,1])
			assert_equal 4, NumberSummary.min([4,5,4,4])
		end
	end

	class Mean < NumberSummaryTest
		def test_finds_the_mean
			assert_equal 3, NumberSummary.mean([1,2,3,4,5])
			assert_equal 2.5, NumberSummary.mean([4,3,1,2])
			assert_equal 2, NumberSummary.mean([3,2,1])
			assert_equal 4.25, NumberSummary.mean([4,5,4,4])
		end
	end

	class Median < NumberSummaryTest
		def test_finds_the_median
			assert_equal 3, NumberSummary.median([1,2,3,4,5])
			assert_equal 2.5, NumberSummary.median([4,3,1,2])
			assert_equal 2, NumberSummary.median([3,2,1])
			assert_equal 4, NumberSummary.median([4,5,4,4])
		end
	end

	class Q3 < NumberSummaryTest
		def test_finds_the_median
			assert_equal 4.5, NumberSummary.q3([1,2,3,4,5])
			assert_equal 3.5, NumberSummary.q3([4,3,1,2])
			assert_equal 3, NumberSummary.q3([3,2,1])
			assert_equal 4.5, NumberSummary.q3([4,5,4,4])
		end
	end

	class Q1 < NumberSummaryTest
		def test_finds_the_median
			assert_equal 1.5, NumberSummary.q1([1,2,3,4,5])
			assert_equal 1.5, NumberSummary.q1([4,3,1,2])
			assert_equal 1, NumberSummary.q1([3,2,1])
			assert_equal 4, NumberSummary.q1([4,5,4,4])
		end
	end

	class Mode < NumberSummaryTest
		def test_finds_the_mode
			assert_equal [2,3], NumberSummary.mode([1,2,2,3,3,5])
			assert_equal [2], NumberSummary.mode([2,3,1,2])
			assert_equal [1], NumberSummary.mode([3,2,1,1,1,6])
			assert_equal [4], NumberSummary.mode([4,5,5,4,4])
			assert_equal [6,7], NumberSummary.mode([6,6,6,7,7,7,8])
		end
	end

	class Sigma < NumberSummaryTest
		def test_finds_the_sigma
			assert_equal 0.25, NumberSummary.sigma([2,3])
			assert_equal 4, NumberSummary.sigma([2,4,4,4,5,5,7,9])
		end
	end
end