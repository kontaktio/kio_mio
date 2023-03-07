module ApplicationHelper
  include Pagy::Frontend

  def kio_date_time(datetime)
    return '-' if datetime.nil?

    if Date.today.year == datetime.year and false # Always show yr for now
      l(datetime, format: :this_year_very_short_d)
    else
      l(datetime, format: :very_short_d)
    end
  end
end
