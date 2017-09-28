module Rushour
  class Daytime
    HOUR_MINUTES = 60.freeze

    class << self
      def from_str(time_str)
        time = time_str.split(':', 2)
        hours_minutes(time[0].to_i, time[1].to_i)
      end

      def now
        time = Time.now
        hours_minutes(time.hour, time.min)
      end

      private

      def hours_minutes(hours, minutes)
        hours * HOUR_MINUTES + minutes
      end
    end
  end
end
