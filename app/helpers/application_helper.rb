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

  def bash_to_html_colors(text)
    colors = {
      30 => '#000', # Black
      31 => '#c00', # Red
      32 => '#0c0', # Green
      33 => '#cc0', # Yellow
      34 => '#00c', # Blue
      35 => '#c0c', # Magenta
      36 => '#0cc', # Cyan
      37 => '#ccc', # Light gray
      90 => '#888', # Dark gray
      91 => '#f00', # Light red
      92 => '#0f0', # Light green
      93 => '#ff0', # Light yellow
      94 => '#00f', # Light blue
      95 => '#f0f', # Light magenta
      96 => '#0ff', # Light cyan
      97 => '#fff'  # White
    }

    # colors_regex = /\e\[([\d;]+)m/
    # text.gsub(colors_regex) do |match|
    #   color_codes = match.scan(/\d+/).map(&:to_i)
    #   html_codes = color_codes.map { |code| colors[code] }.compact.join(';')
    #   "<span style=\"color:#{html_codes}\">"
    # end

    colors_regex = /\e\[([\d;]+)m/
    text.gsub(colors_regex) do |match|
      color_codes = match.scan(/\d+/).map(&:to_i)
      html_codes = color_codes.map { |code| colors[code] }.compact.join(';')
      "<span style=\"\">"
    end

  end

end
