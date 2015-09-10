# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

#Import Global Compulsory CSS Files
Rails.application.config.assets.precompile += %w( style.css )
Rails.application.config.assets.precompile += %w( plugins.css )
Rails.application.config.assets.precompile += %w( blocks.css )

#Import Global Compulsory Javascript Files
Rails.application.config.assets.precompile += %w( bootstrap.min.js )
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
Rails.application.config.assets.precompile += %w( custom-sky-forms.css )
Rails.application.config.assets.precompile += %w( perfect-scrollbar.css )
Rails.application.config.assets.precompile += %w( profile.css )
Rails.application.config.assets.precompile += %w( owl.theme.css )
Rails.application.config.assets.precompile += %w( owl.carousel.css )
Rails.application.config.assets.precompile += %w( nivo-lightbox.css )
Rails.application.config.assets.precompile += %w( animate.min.css )
Rails.application.config.assets.precompile += %w( blue.min.css )
Rails.application.config.assets.precompile += %w( responsive.css )

#Import Javascript Plugins
Rails.application.config.assets.precompile += %w( jquery-migrate.min.js )
Rails.application.config.assets.precompile += %w( back-to-top.js )
Rails.application.config.assets.precompile += %w( jquery.min.js )
Rails.application.config.assets.precompile += %w( jquery.countdown.js )
Rails.application.config.assets.precompile += %w( jquery.backstretch.min.js )
Rails.application.config.assets.precompile += %w( smoothscroll.js )
Rails.application.config.assets.precompile += %w( jquery.scrollTo.min.js )
Rails.application.config.assets.precompile += %w( circles.js )
Rails.application.config.assets.precompile += %w( jquery.mixitup.min.js )
Rails.application.config.assets.precompile += %w( circles-master.js )
Rails.application.config.assets.precompile += %w( page_portfolio.js )
Rails.application.config.assets.precompile += %w( waypoints.min.js )
Rails.application.config.assets.precompile += %w( jquery.counterup.min.js )
Rails.application.config.assets.precompile += %w( jquery.mousewheel.js )
Rails.application.config.assets.precompile += %w( perfect-scrollbar.js )
Rails.application.config.assets.precompile += %w( datepicker.js )
Rails.application.config.assets.precompile += %w( jquery-ui.min.js )
Rails.application.config.assets.precompile += %w( highcharts.js )
Rails.application.config.assets.precompile += %w( owl.carousel.min.js )
Rails.application.config.assets.precompile += %w( nivo-lightbox.min.js )
Rails.application.config.assets.precompile += %w( simple-expand.min.js )
Rails.application.config.assets.precompile += %w( wow.min.js )
Rails.application.config.assets.precompile += %w( jquery.stellar.min.js )
Rails.application.config.assets.precompile += %w( retina.min.js )
Rails.application.config.assets.precompile += %w( jquery.nav.js )
Rails.application.config.assets.precompile += %w( matchMedia.js )
Rails.application.config.assets.precompile += %w( jquery.ajaxchimp.min.js )
Rails.application.config.assets.precompile += %w( jquery.fitvids.js )
Rails.application.config.assets.precompile += %w( html5shiv.js )
Rails.application.config.assets.precompile += %w( respond.min.js )
Rails.application.config.assets.precompile += %w( jquery.scrollTo.min.js )
Rails.application.config.assets.precompile += %w( jquery.localScroll.min.js )

#Import Headers
Rails.application.config.assets.precompile += %w( header-default.css )

#Import Footers
Rails.application.config.assets.precompile += %w( footer-default.css )

#Import Google Font
Rails.application.config.assets.precompile += %w( http://fonts.googleapis.com/css?family=Open+Sans:300,400 )