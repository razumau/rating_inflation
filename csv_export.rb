require "csv"

class Exporter
  def self.export_to_csv(rating_values, filename: "rating_history")
    CSV.open("csv/#{filename}.csv", "w") do |csv|
      columns = %w[date place rating]
      csv << columns

      rating_values.each do |rating_value|
        csv << [rating_value.date, rating_value.place, rating_value.rating]
      end
    end
  end

  def self.export_for_datawrapper(rating_values, filename: "datawrapper")
    by_date = Hash.new { |hash, key| hash[key] = {} }
    rating_values.each do |rating_value|
      by_date[rating_value.date][rating_value.place] = rating_value.rating
    end

    CSV.open("csv/#{filename}.csv", "w") do |csv|
      places = Set.new(rating_values.map(&:place))
      columns = ["date", places.to_a].flatten
      csv << columns

      by_date.each do |date, values|
        csv << [date, values.values].flatten
      end
    end
  end
end
