# frozen_string_literal: true

module TournamentsHelper
  def date_from_datetime(datetime)
    return unless datetime

    datetime.to_date
  end

  def time_from_datetime(datetime)
    return unless datetime

    "#{datetime.time.hour}:#{datetime.time.min}"
  end
end
