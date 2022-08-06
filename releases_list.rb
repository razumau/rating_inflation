class ReleasesList
  def self.list
    lines = File.readlines("release_ids.html")
    lines.map do |line|
      Release.new(line)
    end
  end
end
