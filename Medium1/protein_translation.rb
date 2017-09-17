class InvalidCodonError < StandardError
end

class Translation
  PROTEINS = {
    'AUG' => 'Methionine',
    'UUU' => 'Phenylalanine',
    'UUC' => 'Phenylalanine',
    'UUA' => 'Leucine',
    'UUG' => 'Leucine',
    'UCU' => 'Serine',
    'UCC' => 'Serine',
    'UCA' => 'Serine',
    'UCG' => 'Serine',
    'UAU' => 'Tyrosine',
    'UAC' => 'Tyrosine',
    'UGU' => 'Cysteine',
    'UGC' => 'Cysteine',
    'UGG' => 'Tryptophan',
    'UAA' => 'STOP',
    'UAG' => 'STOP',
    'UGA' => 'STOP'
  }.freeze

  def self.of_codon(codon)
    PROTEINS.fetch(codon) { fail InvalidCodonError }
  end

  def self.of_rna(strand)
    translation = []
    strand.chars.each_slice(3) do |codon|
      break if of_codon(codon.join) == 'STOP'
      translation << of_codon(codon.join)
    end
    translation
  end
end
