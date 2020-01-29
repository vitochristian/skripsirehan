# 
# to change routes from default http to https
if Rails.env.production? && Rails.application.config.force_ssl
  Rails.application.routes.default_url_options[:protocol] = 'https'
end
