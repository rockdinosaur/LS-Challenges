class CircularBuffer

  attr_reader :buffer

  def initialize(n)
    @buffer = Array.new(n)
    @oldest_idx_r = 0
    @oldest_idx_w = 0
  end

  def read
    raise BufferEmptyException if buffer.fetch(@oldest_idx_r).nil?
    @oldest_idx_r = (@oldest_idx_r + 1) % buffer.size
    read = buffer.delete_at(@oldest_idx_r - 1)
    buffer.insert(@oldest_idx_r - 1, nil)
    read
  end

  def write(val)
    return if val.nil?
    raise BufferFullException if buffer.none?(&:nil?)
    buffer[@oldest_idx_w] = val
    @oldest_idx_w = (@oldest_idx_w + 1) % buffer.size
  end

  def write!(val)
    return if val.nil?
    unless buffer[@oldest_idx_w].nil?
      @oldest_idx_r = (@oldest_idx_r + 1) % buffer.size
    end
    buffer[@oldest_idx_w] = val
    @oldest_idx_w = (@oldest_idx_w + 1) % buffer.size
  end

  def clear
    buffer.each_index do |idx|
      buffer[idx] = nil
    end
    @oldest_idx_r = 0
    @oldest_idx_w = 0
  end
end

class BufferEmptyException < StandardError
end

class BufferFullException < StandardError
end
