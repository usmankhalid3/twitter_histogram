require 'date'

class Histogram

	def initialize
		@counts = Array.new(24, 0)
	end

	def add(created_at)
		@counts[created_at.hour] = @counts[created_at.hour] + 1
	end

	def most_active_during
		hour = @counts.each_with_index.max[1]
		time_period(hour)
	end

	def counts_by_hour
		(0..23).map { |hour|
			period = time_period(hour)
			[period, @counts[hour]]
		}.to_h
	end

	def time_period(hour)
		from = meridian_hour(hour)
		to = meridian_hour((hour + 1) % 24)
		"#{from}-#{to}"
	end

	def meridian_hour(hour)
		Time.parse("#{hour}:00").strftime("%-l%P")
	end
end