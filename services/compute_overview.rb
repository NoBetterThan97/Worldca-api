# frozen_string_literal: true
require 'concurrent'

class ComputeOverviewService
  def self.call
    Overview.new(statistics.reduce(0.0) { |acc, elem| acc + total_comsumption(elem) })
  end

  def self.statistics
    FindStatisticsService.call
                         .statistics
  end

  def self.total_comsumption(statistic)
    statistic.food.calories.to_f * statistic.consumptions.to_i
  end
end
