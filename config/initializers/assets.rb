# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'


Rails.configuration.sass.preferred_syntax = "sass"

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( main/styles/orders.css  application-welcome.css application-session.css )
Rails.application.config.assets.precompile += %w( main/styles/orders.css  main/styles/products.css )
