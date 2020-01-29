# API
if Rails.env.development?
  BASE_URL = 'http://10.0.0.171:9100'
  MAIL_URL = 'http://baf-staging-x1:9100/login'
elsif Rails.env.staging?
  BASE_URL = 'http://10.0.0.171:9100'
  MAIL_URL = 'http://baf-staging-x1:9100/login'
elsif Rails.env.production?
  BASE_URL = 'http://supplier.nutrifood.co.id'
  MAIL_URL = 'http://supplier.nutrifood.co.id'
end
