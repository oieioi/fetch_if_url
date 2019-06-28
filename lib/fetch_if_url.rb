# frozen_string_literal: true

require 'fetch_if_url/version'
require 'net/http'
require 'securerandom'

module FetchIfUrl
  class Error < StandardError; end

  # Fetch a file and return its temporary local path if <code>path</code> looks like URL.
  # If it doesn't look like URL return as it be.
  # @param [String] path file path or URL
  # @param [Hash] opts
  # @option opts [String] :dest Destination path when fetching
  # @return [String] local path
  def fetch_if_url(path, dest: '/tmp')
    if url?(path)
      fetch(path, dest)
    else
      # do nothing if local file
      path
    end
  end

  def url?(path)
    path.start_with?(%r{https?://})
  end

  def fetch(url, dest)
    body = Net::HTTP.get(URI.parse(url))
    file_name = "#{dest}/#{Time.now.to_i}-#{SecureRandom.uuid}"
    File.open(file_name, 'wb') { |file| file.write(body) }
    file_name
  end

  module_function :fetch_if_url, :url?, :fetch
  private_class_method :url?, :fetch
end
