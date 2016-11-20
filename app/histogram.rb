require 'date'

class Histogram

	attr_reader :counts

	def initialize
		@counts = Array.new(24,0)
	end

	def add(created_at)
		@counts[created_at.hour] = @counts[created_at.hour] + 1
	end

	def most_active_at
		@counts.each_with_index.max[1]
	end

end