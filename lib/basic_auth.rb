module MingleAccess
  
  class BasicAuth
    
        attr_reader :base_url

        BASIC_AUTH_HTTP_WARNING = %{     
    WARNING!!!
    It looks like you are using basic authentication over a plain-text HTTP connection. 
    We HIGHLY recommend AGAINST this practice. You should only use basic authentication over
    a secure HTTPS connection. Instructions for enabling HTTPS/SSL in Mingle can be found at
    <http://www.thoughtworks-studios.com/mingle/3.4/help/advanced_mingle_configuration.html>
    WARNING!!
    }

        def initialize(base_url, username, password)
          @base_url = base_url
          @username = username
          @password = password
        end

        # Fetch the content at location via HTTP. Throws error if non-200 response.
        def fetch_page(location) 
          rsp = fetch_page_response(location)    
          case rsp
          when Net::HTTPSuccess
            rsp.body
          when Net::HTTPUnauthorized
            raise HttpError.new(rsp, location, %{
    If you think you are passing correct credentials, please check 
    that you have enabled Mingle for basic authentication. 
    See <http://www.thoughtworks-studios.com/mingle/3.4/help/configuring_mingle_authentication.html>.})
          else
            raise HttpError.new(rsp, location) 
          end
        end

        private

        def fetch_page_response(location)
          location = @base_url + location if location[0..0] == '/' 

          uri = URI.parse(location)
          http = Net::HTTP.new(uri.host, uri.port)

          if uri.scheme == 'https'
            http.use_ssl = true
            http.verify_mode = OpenSSL::SSL::VERIFY_NONE
          else
            MingleAccess.log.warn BASIC_AUTH_HTTP_WARNING
          end

          path = uri.path
          path += "?#{uri.query}" if uri.query
          MingleAccess.log.info "Fetching page at #{path}..."

          start = Time.now
          req = Net::HTTP::Get.new(path)
          req.basic_auth(@username, @password)
          rsp = http.request(req)
          MingleAccess.log.info "...#{path} fetched in #{Time.now - start} seconds."

          rsp
        end
    
  end
  
end