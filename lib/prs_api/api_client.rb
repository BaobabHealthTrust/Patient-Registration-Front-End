require "net/http"

class ApiClient
  # TODO: There are some puts statements littered in this module. Try to
  # find a way to use rails logger from outside Rail modules like this one
  # or at least log the messages to stderr.

  API_URL = 'http://localhost:8000'  # TODO: Move this to some configuration file.
  JSON_CONTENT_TYPE = 'application/json'

  def initialize(api_key = nil)
    @api_key = api_key
  end

  def get(resource)
    uri = build_uri resource
    request = Net::HTTP::Get.new(uri)
    prepare_request request
    exec_request request, uri
  end

  def post(resource, data)
    puts data
    uri = build_uri resource
    request = Net::HTTP::Post.new(uri)
    prepare_request request
    request['Content-type'] = JSON_CONTENT_TYPE
    request.body = JSON.dump(data)
    exec_request request, uri
  end

  private
    # Returns a URI object with API host attached
    def build_uri(resource)
      URI("#{API_URL}/#{resource}")
    end

    # This just sets the API key
    def prepare_request(request)
      request['x-api-key'] = @api_key if @api_key
      request
    end

    def exec_request(request, uri)
      begin
        response = Net::HTTP.start(uri.hostname, uri.port) do |http|
          puts 'Connecting to API at ' + uri.to_s
          http.request(request)
        end
      rescue StandardError => e
        # Catch all because there are like a million errors Net::HTTP
        # throws and they all don't share a common ancestor but StandardError
        # See: https://stackoverflow.com/questions/5370697/what-s-the-best-way-to-handle-exceptions-from-nethttp
        puts "Unable to communicate with API: #{e}"
        return nil, 0
      end

      unless response['content-type'].include? JSON_CONTENT_TYPE
        puts 'Invalid response from API: content-type: ' + response['content-type']
        return nil, 0
      end

      return JSON.parse(response.body), response.code.to_i
    end
end