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
			return ((n / array1.length).to_f).round(2)
		end

		def median(array)
  		sorted = array.sort
  		med = calc_median(sorted)
  		return med.round(1)
		end

		def q1(array)
			sorted = array.sort
			(median(sorted[0...(sorted.length) / 2])).round(1)
		end

		def q3(array)
			sorted = array.sort
			(median(sorted[(sorted.length + 1) / 2...sorted.length])).round(1)
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
					count += 1
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
				dev = (array[i] - mean) ** 2
				sum_dev += dev
			end
			return (Math.sqrt(sum_dev / (array.length - 1))).round(1)
		end

		def summarize(filename)
			read = CSV.read(filename)
			data = floatConvert(read[0])
			return """Number Summary:
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
			def floatConvert(fileData)
				for i in 0...fileData.length
					fileData[i] = fileData[i].to_f
				end
				return fileData
			end
	end
end
	