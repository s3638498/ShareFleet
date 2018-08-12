# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )



# //= require main
# //= require jquery.magnific-popup.min
# //= require owl.carousel.min
# //= require superfish.min
# //= require jquery.nice-select.min
# //= require bootstrap.min
# //= require jquery-2.2.4.min
# //= require jquery
# //= require jquery2
# //= require jquery_ujs

# for bootstrap.css
Rails.application.config.assets.precompile += %w( bootstrap.css )

# for home menu selection css
Rails.application.config.assets.precompile += %w( nice-select.css )

# owl carousel
Rails.application.config.assets.precompile += %w( owl.carousel.css )

# jquerysctipttop
Rails.application.config.assets.precompile += %w( jquerysctipttop.css )

# linearicons
Rails.application.config.assets.precompile += %w( linearicons.css )