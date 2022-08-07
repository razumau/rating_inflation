require_relative './csv_export'
require_relative './downloader'
require_relative './parser'
require_relative './release'
require_relative './releases_list'

RatingValue = Struct.new(:date, :place, :rating)

places = [1, 10, 20, 50, 100]

all_releases = ReleasesList.list

all_releases.each do |release|
  Downloader.download_page(release.id)
end

parsed = all_releases.map do |release|
  Parser.new(release, places).parse_release
end.flatten(1)

Exporter.export_to_csv(parsed)
Exporter.export_for_datawrapper(parsed)
