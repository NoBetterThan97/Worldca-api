# frozen_string_literal: true
require 'base64'

module Base64Serialization
  def base64_encode(string)
    Base64.urlsafe_encode64(string)
  end

  def base64_decode(string)
    Base64.urlsafe_decode64(string)
  end
end
