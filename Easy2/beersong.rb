class BeerSong
  def verse(x, y = nil) # try y = x
    y = x if y.nil?
    song = ''
    x.downto(y) do |counter|
      case counter
      when 3..Float::INFINITY
        song << "#{counter} bottles of beer on the wall, #{counter} bottles of beer.\n" \
        "Take one down and pass it around, #{counter - 1} bottles of beer on the wall.\n"
        song << "\n" if multiple?(counter, y)
      when 2
        song << "#{counter} bottles of beer on the wall, #{counter} bottles of beer.\n" \
        "Take one down and pass it around, #{counter - 1} bottle of beer on the wall.\n"
        song << "\n" if multiple?(counter, y)
      when 1
        song << "1 bottle of beer on the wall, 1 bottle of beer.\n" \
        "Take it down and pass it around, no more bottles of beer on the wall.\n"
        song << "\n" if multiple?(counter, y)
      when 0
        song << "No more bottles of beer on the wall, no more bottles of beer.\n" \
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
      end
    end
    song
  end

  def verses(x, y)
    verse(x, y)
  end

  def lyrics
    verse(99, 0)
  end

  def multiple?(counter, y)
    counter - y > 0
  end
end

p BeerSong.new.verse(99, 98)
