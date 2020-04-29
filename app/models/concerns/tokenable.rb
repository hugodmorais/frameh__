module Tokenable
  extend ActiveSupport::Concern

  included do
    def generate_token(column, token_size = 10)
      self[column] = loop do
        token = SecureRandom.hex(token_size)
        break token unless self.class.exists?(column => token)
      end
    end
  end
end