class UrlValidator < ActiveModel::Validator
  def validate(record)
    record.errors[:original_url] << 'Not a valid url' unless record.original_url.present? && valid_url?(record.original_url)
  end

  private

  def valid_url?(url_string)
    url = URI.parse(url_string)
    ([URI::HTTP, URI::HTTPS].include? url.class) && url.host.present?
  rescue URI::InvalidURIError
    false
  end
end