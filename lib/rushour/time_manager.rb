module Rushour
  class TimeManager
    def initialize
      @intervals = Rushour::Settings.intervals.map do |interval|
        Rushour::Interval.new(Rushour::Daytime.from_str(interval[:start]),
                              Rushour::Daytime.from_str(interval[:finish]))
      end
    end

    def check
      now = Rushour::Daytime.now
      if @intervals.any? { |interval| interval.in?(now) }
        @on_start_hook.call unless @in_interval || @in_interval == nil
        @in_interval = true
      else
        @on_finish_hook.call if @in_interval || @in_interval == nil
        @in_interval = false
      end
    end

    def on_start(&block)
      @on_start_hook = block
    end

    def on_finish(&block)
      @on_finish_hook = block
    end
  end
end
