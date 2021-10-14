# frozen_string_literal: true

module TournamentsHelper
  def date_from_datetime(datetime)
    datetime.to_date
  end

  def time_from_datetime(datetime)
    "#{datetime.time.hour}:#{datetime.time.min}"
  end
end
