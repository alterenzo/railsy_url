class Url < ApplicationRecord
  before_validation :add_protocol_to_url
  validates_with UrlValidator

  private

  def add_protocol_to_url
    self.original_url = 'http://' + original_url unless url_has_protocol?
  end

  def url_has_protocol?
    (original_url.start_with? 'http://') || (original_url.start_with? 'https://')
  end
end
