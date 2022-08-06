require 'date'

class Release
  attr_reader :id, :date

  LINE_PATTERN = /<option value=\"(?<release_id>\d+)\">(?<date_str>.*)<\/option>/

  MONTHS = {
    "января" => "01",
    "февраля" => "02",
    "марта" => "03",
    "апреля" => "04",
    "мая" => "05",
    "июня" => "06",
    "июля" => "07",
    "августа" => "08",
    "сентября" => "09",
    "октября" => "10",
    "ноября" => "11",
    "декабря" => "12"
  }

  def initialize(line)
    match = LINE_PATTERN.match(line)
    @id = match.match(:release_id).to_i

    date_raw = match.match(:date_str)
    date_formatted = date_raw.gsub(date_raw.split[1], MONTHS)
    @date = Date.strptime(date_formatted, "%d %m %Y").strftime("%Y-%m-%d")
  end
end
