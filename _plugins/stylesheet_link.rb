module Jekyll

    class StylesheetTag < Liquid::Tag
      def initialize(tag_name, params, tokens)
        super
        @params = params
      end

      def render(context)
        params = @params.split("|")
        css = params[0].to_s.strip!.gsub!(/^["']/, "").gsub!(/["']$/, "")
        media = params[1].to_s.strip!.gsub!(/^["']/, "").gsub!(/["']$/, "")
        mtime = rand 1000000000
        # mtime = Time.now.to_i
        # mtime = sprintf("%.0f", mtime)

        return %Q{<link rel="stylesheet" href="/assets/themes/salsacaribecouk/css/#{css}.css?#{mtime}" media="#{media}" />}
      end
    end

  end

  Liquid::Template.register_tag('stylesheet', Jekyll::StylesheetTag)

