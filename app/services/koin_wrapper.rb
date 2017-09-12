class KoinWrapper

  class << self

    def register_company(attributes)
      api_url = "#{self.new.current_endpoint}/companies/register"
      response = RestClient.post(api_url, attributes.merge(access_token: self.new.access_token))
      return true
    rescue
      return false
    end

    def apply_loan(attributes)
      api_url = "#{self.new.current_endpoint}/loans/apply"
      response = RestClient.post(api_url, attributes.merge(access_token: self.new.access_token))
      return true
    rescue
      return false
    end

    # Give user email
    def get_loans(attributes)

    end

    # Give loan id (from koinworks)
    def get_loan(attributes)

    end

  end

  #                                                               Instance Methods
  # ==============================================================================
  def current_endpoint
    if Rails.env.production?
      "http://koinworks.com/api/v1"
    else
      "http://localhost:3000/api/v1"
    end
  end

  def access_token
    if Rails.env.production?
      "96b364062e51af18e1ff32b50121201358424a44682ee80fd36c706e533ef2e2"
    else
      "e1f34bea59f17d6afce5cc1421b04ef89092f1a8606d58ed9792294aa23810a5"
    end
  end

end
