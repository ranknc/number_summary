# @author Colter Giem <coltergiem@gmail.com>
# @author Nick Rank <ranknc@s.dcsdk12.org>

require 'csv'

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

		def mode(array)
			sorted = array.sort
			repeats = []
			numbers = []
			final = []
			count = 0
			mode = 0
			for i in 0...sorted.length
				if sorted[i] == sorted[i+1]
					count += 1
				else
					if(i+1 == sorted.length)
						false
					else
					count += 1
					end
					repeats.push(count)
					numbers.push(sorted[i])
					count = 0
				end
			end
			for i in 0...repeats.length
				repeats[i] == repeats.max ? final.push(numbers[i]) : false
			end
			final
		end
	

		def sigma(array)
			mean = mean(array)
			sum_dev = 0
			for i in 0...array.length
				dev = (array[i] - mean) * (array[i] - mean)
				sum_dev += dev
			end
			return sum_dev / array.length
		end

		def summarize(filename)
			data = read(filename)
			return """
			Number Summary:
			min: #{min(data)}
			max: #{max(data)}
			mean: #{mean(data)}
			median: #{median(data)}
			q1: #{q1(data)}
			q3: #{q3(data)}
			mode: #{mode(data)}
			sigma: #{sigma(data)}
			"""
		end

		private
			def read(file)
				read = CSV.read(file)
				for i in 0...read.length
					read[i] = '%.2f' % read[i]
				end
				return read
			end
	end
end
	