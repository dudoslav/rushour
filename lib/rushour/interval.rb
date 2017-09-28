module Rushour
  class Interval
    def initialize(start, finish)
      @start = start
      @finish = finish
    end

    def in?(time)
      @start < time && time < @finish # TODO: Bug here if leap day
    end
  end
end
