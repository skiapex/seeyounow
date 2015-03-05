# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

#Import Global Compulsory CSS Files
Rails.application.config.assets.precompile += %w( style.css )
Rails.application.config.assets.precompile += %w( plugins.css )
Rails.application.config.assets.precompile += %w( font-awesome.css.scss.erb )
Rails.application.config.assets.precompile += %w( blocks.css )

#Import Global Compulsory Javascript Files
Rails.application.config.assets.precompile += %w( custom.js )
Rails.application.config.assets.precompile += %w( app.js )
Rails.application.config.assets.precompile += %w( login.js )

#Import CSS Plugins
Rails.application.config.assets.precompile += %w( animate.css )
Rails.application.config.assets.precompile += %w( box-shadows.css )
Rails.application.config.assets.precompile += %w( style-switcher.css )
Rails.application.config.assets.precompile += %w( line-icons.css )
Rails.application.config.assets.precompile += %w( page_log_reg_v2.css )
Rails.application.config.assets.precompile += %w( default.css )
Rails.application.config.assets.precompile += %w( custom.css )
Rails.application.config.assets.precompile += %w( portfolio-v2.css )

#Import Javascript Plugins
Rails.application.config.assets.precompile += %w( jquery.min.js )
Rails.application.config.assets.precompile += %w( jquery-migrate.min.js )
Rails.application.config.assets.precompile += %w( bootstrap.min.js )
Rails.application.config.assets.precompile += %w( back-to-top.js )
Rails.application.config.assets.precompile += %w( jquery.min.js )
Rails.application.config.assets.precompile += %w( jquery.countdown.js )
Rails.application.config.assets.precompile += %w( jquery.backstretch.min.js )
Rails.application.config.assets.precompile += %w( jquery.min.js )
Rails.application.config.assets.precompile += %w( circles.js )
Rails.application.config.assets.precompile += %w( jquery.mixitup.min.js )
Rails.application.config.assets.precompile += %w( circles-master.js )
Rails.application.config.assets.precompile += %w( page_portfolio.js )

#Import Headers
Rails.application.config.assets.precompile += %w( headers/header-default.css )
Rails.application.config.assets.precompile += %w( headers/header-v1.css )
Rails.application.config.assets.precompile += %w( headers/header-v2.css )
Rails.application.config.assets.precompile += %w( headers/header-v3.css )
Rails.application.config.assets.precompile += %w( headers/header-v4.css )

#Import Footers
Rails.application.config.assets.precompile += %w( footers/footer-default.css )
Rails.application.config.assets.precompile += %w( footers/footer-v1.css )
Rails.application.config.assets.precompile += %w( footers/footer-v2.css )
Rails.application.config.assets.precompile += %w( footers/footer-v3.css )
Rails.application.config.assets.precompile += %w( footers/footer-v4.css )
Rails.application.config.assets.precompile += %w( footers/footer-v5.css )
Rails.application.config.assets.precompile += %w( footers/footer-v6.css )
Rails.application.config.assets.precompile += %w( footers/footer-v7.css )

#Import Google Font
Rails.application.config.assets.precompile += %w( http://fonts.googleapis.com/css?family=Open+Sans:300,400 )