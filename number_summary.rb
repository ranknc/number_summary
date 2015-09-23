# @author Colter Giem <coltergiem@gmail.com>
# @author Nick Rank <ranknc@s.dcsdk12.org>
class NumberSummary
	
	class << self

		def max(array1)
			return array1.max
		end

		def min(array1)
			return array1.min
		end

		def mean(array1)
			n = 0
			for i in 0...array1.length
				n += array1[i].to_f
			end
			return (n / array1.length).to_f
		end

		def median(array)
  		sorted = array.sort
  		med = calc_median(sorted)
  		return med
		end

		def q1(array)
			sorted = array.sort
			median(sorted[0...(sorted.length) / 2])
		end

		def q3(array)
			sorted = array.sort
			median(sorted[(sorted.length + 1) / 2...sorted.length])
		end

		def calc_median(array1)
			return (array1[(array1.length - 1) / 2] + array1[array1.length / 2]) / 2.0
		end
# puts median([1, 2, 3, 4, 5]).to_s

		def mode(array1)
			lengthArray = []
			mode = 0
			for i in 0...array1.length
				count = 0
				for j in i...array1.length
					if array1[i] == array1[j]
						count += 1
					end
					puts count
					# lengthArray.push[count]
					# if count == lengthArray.max
					# mode = array1[i]
					# end
				end
			end
			return mode
		end

	end

end