# frozen_string_literal: true
class OverviewRepresenter < Roar::Decorator
  include Roar::JSON

  property :calories
end
