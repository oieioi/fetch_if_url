require "fetch_if_url/version"
require 'net/http'
require "securerandom"

module FetchIfUrl
  class Error < StandardError; end

  def fetch_if_url(path, dest: '/tmp')
    if on_network?(path)
      download(path, dest)
    else
      # do nothing if local file
      path
    end
  end

  def on_network?(path)
    path.start_with?(%r[https?://])
  end

  def download(url, dest)
    body = Net::HTTP.get(URI.parse(url))
    file_name = "#{dest}/#{Time.now.to_i}-#{SecureRandom.uuid}"
    File.open(file_name, 'wb') { |file| file.write(body) }
    file_name
  end

  module_function :fetch_if_url, :on_network?, :download
  private_class_method :on_network?, :download
end
