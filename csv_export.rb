require "csv"

class Exporter
  COLUMNS = %w[date place rating]

  def self.export_to_csv(rating_values, places_to_export: nil, filename: "rating_history")
    CSV.open("#{filename}.csv", "w") do |csv|
      csv << COLUMNS
      rating_values.each do |rating_value|
        if !places_to_export.nil? && places_to_export.include?(rating_value.place)
          csv << [rating_value.date, rating_value.place, rating_value.rating]
        end
      end
    end
  end
end
