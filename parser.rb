require 'nokogiri'

class Parser
  def initialize(release)
    @release = release
  end

  def parse_release
    doc = File.open("pages/#{@release.id}.html") { |f| Nokogiri::HTML(f) }
    (1..150).map do |place|
      rating = doc.xpath("//*[@id='teams_table']/tbody/tr[#{place}]/td[4]").to_s.split[1].to_i
      [@release.date, place, rating]
    end
  end
end
