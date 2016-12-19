class Timer
  attr_accessor :seconds

  def initialize(seconds = 0)
    @seconds = seconds
  end

    def add_zero_if_single_digit(num)
      if num < 10
        number = "0#{num}"
      else
        number = "#{num}"
      end
      number
    end

    def to_seconds
      @seconds % 60
    end

    def to_minutes
      minutes_only = @seconds / 60
      hours = minutes_only / 60
      minutes_only % 60
    end

    def to_hours
      @seconds/3600
    end

    def time_string
      second = add_zero_if_single_digit(to_seconds)
      minute = add_zero_if_single_digit(to_minutes)
      hour = add_zero_if_single_digit(to_hours)
      "#{hour}:#{minute}:#{second}"
    end
end
