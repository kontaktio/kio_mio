module PresencesHelper
  def average_duration(presences)
    duration_average = (presences.map { |presence| presence.device_duration }.compact.sum / presences.size) unless presences.size == 0
    number_with_precision(presence.device_duration, precision: 2)
  end
end
