require 'httparty'

class BetterDoctorApi
  include HTTParty
  base_uri 'https://api.betterdoctor.com'
  default_timeout 1

  def api_key
    "?user_key=#{Rails.application.secrets.betterdoctor_api_key}"
  end

  def base_path
    '/2015-09-22'
  end

  def doctors_search(options = {})
    begin
      response = Rails.cache.fetch({ namespace: 'doctors_search', options: options }, expires_in: 30.minutes) do
        url = "#{base_path}/doctors#{api_key}"
        Marshal.dump(self.class.get(url, query: options).to_h)
      end
    rescue Net::OpenTimeout, Net::ReadTimeout
      {}
    end
    Marshal.load(response)
  end
end
