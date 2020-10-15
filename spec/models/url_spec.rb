require 'rails_helper'

RSpec.describe Url, type: :model do
  it 'adds the protocol to the url if it does not have one' do
    url = described_class.create(original_url: 'www.google.com')
    expect(url.original_url).to start_with('http://')
  end

  it 'does not add the protocol if the url already has one' do
    url = described_class.create(original_url: 'https://www.google.com')
    expect(url.original_url).to eq 'https://www.google.com'
  end

  describe 'validations' do
    it 'is valid with a valid url without a protocol' do
      url = described_class.new(original_url: 'www.google.com')
      expect(url).to be_valid
    end

    it 'is valid with a valid url with http protocol' do
      url = described_class.new(original_url: 'http://www.google.com')
      expect(url).to be_valid
    end

    it 'is valid with a valid url with https protocol' do
      url = described_class.new(original_url: 'https://www.google.com')
      expect(url).to be_valid
    end

    it 'is not valid with an invalid url' do
      url = described_class.new(original_url: '//')
      expect(url).not_to be_valid
    end

    it 'is not valid with a nil url' do
      url = described_class.new(original_url: nil)
      expect(url).not_to be_valid
    end
  end
end
