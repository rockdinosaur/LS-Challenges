class Clock
  def self.at(hours, minutes = 0)
    new(hours, minutes)
  end

  attr_accessor :total_minutes

  def initialize(hours, minutes)
    @total_minutes = hours * 60 + minutes
  end

  def to_s
    hour_str = ((total_minutes / 60) % 24).to_s
    min_str = (total_minutes % 60).to_s
    format("%02d:%02d", hour_str, min_str)
  end

  def +(n)
    self.total_minutes += n
    self
  end

  def -(n)
    self.total_minutes -= n
    self
  end

  def ==(other_clock)
    total_minutes == other_clock.total_minutes
  end
end
