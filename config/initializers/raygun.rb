Raygun.setup do |config|
  config.api_key = "njEC/WfFrqQlenCugGPU9g=="
  config.filter_parameters = Rails.application.config.filter_parameters

  config.enable_reporting = true

  # The default is Rails.env.production?
  # config.enable_reporting = !Rails.env.development? && !Rails.env.test?
end