class DNA
  attr_reader :dna, :shorter_strand, :longer_strand

  def initialize(dna)
    @dna = dna
  end

  # def compare_dna_lengths(other_dna)
  #   if dna.length <= other_dna.length
  #     @shorter_strand = dna
  #     @longer_strand = other_dna
  #   else
  #     @shorter_strand = other_dna
  #     @longer_strand = dna
  #   end
  # end
  #
  # def hamming_distance(other_dna)
  #   compare_dna_lengths(other_dna)
  #   hamming_distance = 0
  #
  #   shorter_strand.chars.each_with_index do |base, idx|
  #     hamming_distance += 1 if base != longer_strand[idx]
  #   end
  #   hamming_distance
  # end

  def hamming_distance(other_dna)
    strand_1 = dna.chars[0..other_dna.length - 1]
    strand_2 = other_dna.chars

    strand_1.zip(strand_2).count { |x, y| x != y }
  end
end
