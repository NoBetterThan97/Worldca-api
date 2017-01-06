class ErrorRepresenter < Roar::Decorator
  include Roar::JSON

  property :status
  property :message
end
