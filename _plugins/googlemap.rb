module Jekyll
  class Youtube < Liquid::Tag

    def initialize(name, map_url, tokens)
      super
      @map_url = map_url
    end

    def render(context)
      %(<div class="embed-media-block"><iframe frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="#{@map_url}"></iframe></div>)
    end
  end
end

Liquid::Template.register_tag('googlemap', Jekyll::Youtube)
