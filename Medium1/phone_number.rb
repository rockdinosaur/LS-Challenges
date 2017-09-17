class PhoneNumber
  attr_reader :n

  def initialize(n)
    @n = n
  end

  def number
    if n =~ /\A1{0,1}\D*\d\D*\d\D*\d\D*\d\D*\d\D*\d\D*\d\D*\d\D*\d\D*\d\z/
      match = n.match(/\A1{0,1}\D*\d\D*\d\D*\d\D*\d\D*\d\D*\d\D*\d\D*\d\D*\d\D*\d\z/).to_s
      match.gsub!(/\D/, '')
      if match.length >= 11 && match[0] == '1'
        @area_code = match[1..3]
        @phone_number = match[1..-1]
      elsif match.length == 10
        @area_code = match[0..2]
        @phone_number = match
      end
    else
      '0000000000'
    end
  end

  def area_code
    number
    @area_code
  end

  def to_s
    "(#{area_code}) #{number[3..5]}-#{number[6..-1]}"
  end
end
