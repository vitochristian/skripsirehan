module ApiService
  class CheckFile
    def initialize(vendor_id, type)
      @vendor_id = vendor_id
      @type = type
    end

    def execute
      response = Faraday.get "#{BASE_URL}/api/images/#{@vendor_id}/check_path?format=#{@type}"

      data = JSON.parse(response.body)

      if data['status'].present? && data['status'] == 404
        return false
      else
        return true
      end
    end
  end
end