class Url < ApplicationRecord
  before_validation :add_protocol_to_url
  validates_with UrlValidator

  private

  def add_protocol_to_url
    return unless original_url.present?

    self.original_url = 'http://' + original_url unless url_has_protocol?
  end

  def url_has_protocol?
    (original_url.starts_with? 'http://') || (original_url.starts_with? 'https://')
  end
end
