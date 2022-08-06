require "csv"

class Exporter
  COLUMNS = %w[date place rating]

  def self.export_to_csv(rows, places_to_export: nil, filename: "rating_history")
    CSV.open("#{filename}.csv", "w") do |csv|
      csv << COLUMNS
      rows.each do |row|
        if !places_to_export.nil? && places_to_export.include?(row[1])
          csv << row
        end
      end
    end
  end
end
