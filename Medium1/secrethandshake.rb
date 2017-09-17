class SecretHandshake
  attr_reader :binary_str

  SECRET_CONVERSION = ['wink', 'double blink', 'close your eyes', 'jump'].freeze

  def initialize(n)
    @binary_str = n.to_i.to_s(2)
  end

  def commands
    binary_str.chars.reverse.each_with_index.with_object([]) do |(n, idx), msg|
      if n == '1' && idx == 4
        msg.reverse!
        next
      end
      msg << SECRET_CONVERSION[idx] if n == '1'
    end
  end
end
