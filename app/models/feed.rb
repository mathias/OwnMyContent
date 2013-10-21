class Feed < ActiveRecord::Base
  belongs_to :user
  has_many :enclosures

  after_save :parse_feed!

  def server_path
    "#{self.user.server_path}/#{self.id}"
  end

  def client_path
    "#{self.user.client_path}/#{self.title}"
  end

  def upload_to_dropbox!
    self.enclosures.each do |enc|
      enc.upload_to_dropbox! if enc.upload?
    end
  end

  def download_enclosures!
    self.enclosures.each do |enc|
      enc.save_to_server
    end
  end

  # ==================
  # Upon creation
  # ===================
  def xml
    @feed ||= FeedzirraPodcast::Parser::Podcast.parse(open(self.url))
  end

  def parse_feed!
    self.update_attribute(:title, xml.title)
    xml.items.each do |item|
      self.enclosures.create({url: item.enclosure.url})
    end
  end

end
