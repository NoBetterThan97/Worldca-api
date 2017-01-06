# frozen_string_literal: true
class Error
  attr_accessor :status, :message

  def initialize(status, message)
    @status = status
    @message = message
  end
end

# define error status
class Error
  module Status
    BAD_REQUEST = 400
    NOT_FOUND = 404
  end
end
