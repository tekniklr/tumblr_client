require 'faraday'
require 'faraday/oauth1'
require 'faraday/multipart'

module Tumblr
  module Connection

    def connection
      Faraday.new(url: "#{api_scheme}://#{api_host}/") do |conn|
        unless credentials.empty?
          conn.request :oauth1, "header", **credentials
        end
        conn.request :multipart
        conn.request :url_encoded
        conn.response :json, content_type: /\bjson$/
        conn.adapter Faraday.default_adapter
        conn.headers.update({
          accept: 'application/json',
          user_agent: "tumblr_client/#{Tumblr::VERSION}"
        })
      end
    end

  end
end
