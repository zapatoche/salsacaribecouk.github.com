module Jekyll
  module AssetFilter
    def asset_url(input)      
      "/assets/themes/salsacaribecouk/css/#{input}.css?#{Time.now.to_i}"
    end
  end
end

Liquid::Template.register_filter(Jekyll::AssetFilter)
