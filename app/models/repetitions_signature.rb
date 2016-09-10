class RepetitionsSignature < ApplicationRecord
  belongs_to :user
  validates :signature, presence: true

  def signature=(string_signature)
    super RepetitionsSignature.normalize string_signature
  end

  def self.normalize(string_signature)
    string_signature.
      downcase.
      gsub(/(\d+)s/, "\\1S").
      gsub(/[^\d\/\sS]/, '').
      gsub('S', 's').
      gsub(/\s+/, ' ').
      strip.
      gsub(/\s*\/\s*/, '/').
      gsub(/(^\/+)|(\/+$)/, '')
  end

  def repetitions
    signature.split('/').map do |part|
      part.gsub(/\d+s/, '').strip.to_i
    end
  end
end
