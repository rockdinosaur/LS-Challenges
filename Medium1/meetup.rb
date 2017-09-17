require 'date'

class Meetup
  DOW = { # days of the week
    monday: 1,
    tuesday: 2,
    wednesday: 3,
    thursday: 4,
    friday: 5,
    saturday: 6,
    sunday: 7
  }.freeze

  DIM = { # days in a month
    1 => 31,
    2 => 28,
    3 => 31,
    4 => 30,
    5 => 31,
    6 => 30,
    7 => 31,
    8 => 31,
    9 => 30,
    10 => 31,
    11 => 30,
    12 => 31
  }.freeze

  attr_reader :yr, :m

  def initialize(month, year)
    @yr = year
    @m = month
  end

  def day(day_of_week, category)
    case category
    when :teenth
      min_date = 13
      max_date = 19
    when :first
      min_date = 1
      max_date = 7
    when :second
      min_date = 8
      max_date = 14
    when :third
      min_date = 15
      max_date = 21
    when :fourth
      min_date = 22
      max_date = 28
    when :last
      max_date = DIM[m]
      max_date += 1 if m == 2 && yr % 4 == 0 # leap year
      min_date = max_date - 6
    end
    calculate(day_of_week, min_date, max_date)
  end

  def calculate(day_of_week, min_date, max_date)
    until DOW[day_of_week] == Date.new(yr, m, min_date).cwday
      min_date += 1
      break if min_date > max_date
    end
    Date.new(yr, m, min_date)
  end
end
