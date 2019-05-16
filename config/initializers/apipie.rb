Apipie.configure do |config|
  config.app_name = 'Seasonvar'
  config.api_base_url = '/api'
  config.doc_base_url = '/apipie'
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/api/**/*.rb"
  config.translate = nil
  config.validate = false
end
