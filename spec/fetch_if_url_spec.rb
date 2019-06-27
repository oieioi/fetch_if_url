# frozen_string_literal: true

RSpec.describe FetchIfUrl do
  it 'has a version number' do
    expect(FetchIfUrl::VERSION).not_to be nil
  end

  it 'fetch a file if its path looks like URL' do
    expect(FetchIfUrl.fetch_if_url('http://example.com/index.html', dest: '/tmp')).to include '/tmp'
  end

  it 'return local path if its looks like local path' do
    expect(FetchIfUrl.fetch_if_url('assets/test_file', dest: '../tmp')).to eq 'assets/test_file'
  end
end
