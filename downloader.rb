class Downloader
  def self.download_page(release_id)
    filename = "pages/#{release_id}.html"
    if File.exist?(filename)
      return
    end

    `curl -o #{filename} "https://rating.chgk.info/teams.php?order=rating&release=#{release_id}"`
  end
end
