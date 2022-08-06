class Downloader
  def self.download_page(release_id)
    filename = "pages/#{release_id}.html"
    return if File.exist?(filename)

    `curl -o #{filename} "https://rating.chgk.info/teams.php?order=rating&release=#{release_id}"`
  end
end
