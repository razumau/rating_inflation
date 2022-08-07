require 'nokogiri'

class Parser
  def initialize(release, places=nil)
    @release = release
    @places = places || (1..150)
  end

  def parse_release
    doc = File.open("pages/#{@release.id}.html") { |f| Nokogiri::HTML(f) }
    @places.map do |place|
      rating = doc.xpath("//*[@id='teams_table']/tbody/tr[#{place}]/td[4]").to_s.split[1].to_i
      RatingValue.new(@release.date, place, rating)
    end
  end
end
