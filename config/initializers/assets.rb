Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.precompile += %w( pignose.layerslider.css )
Rails.application.config.assets.precompile += %w( style.css )
Rails.application.config.assets.precompile += %w( easyResponsiveTabs.js )
Rails.application.config.assets.precompile += %w( pignose.layerslider.js )
Rails.application.config.assets.precompile += %w( responsiveslides.min.js )
Rails.application.config.assets.precompile += %w( imagezoom.js )
Rails.application.config.assets.precompile += %w( simpleCart.min.js )
