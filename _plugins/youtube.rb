class YouTube < Liquid::Tag
    Syntax = /^\s*([^\s]+)(\s+(\d+)\s+(\d+)\s*)?/
  
    def initialize(tagName, markup, tokens)
      super
  
      if markup =~ Syntax then
        @id = $1
      else
        raise "No YouTube ID provided in the \"youtube\" tag"
      end
    end
  
    def render(context)
      # "<iframe width=\"#{@width}\" height=\"#{@height}\" src=\"http://www.youtube.com/embed/#{@id}\" frameborder=\"0\"allowfullscreen></iframe>"
      "<div class='embed-responsive'><iframe data-src='https://www.youtube-nocookie.com/embed/#{@id}?color=black&theme=dark' frameborder='0' title='YouTube Video Content'></iframe></div>"
    end
  
    Liquid::Template.register_tag "youtube", self
  end