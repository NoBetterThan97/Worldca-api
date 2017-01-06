# frozen_string_literal: true
require_relative 'statistic'

class StatisticsRepresenter < Roar::Decorator
  include Roar::JSON

  collection :statistics, extend: StatisticRepresenter, class: Statistic
end
