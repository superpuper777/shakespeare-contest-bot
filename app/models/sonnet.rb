class Sonnet < ApplicationRecord
  require 'mechanize'

  def self.parser
    page = a.get("http://shakespeare.mit.edu/")
    novel_links = page.links_with(href: %r{^Poetry/\w+})
    sonnet_links = novel_links.first.click
    sonnet_names = sonnet_links.css('dt a').map{ |a| a.text }
    content = sonnet_links.links.map do |link|
      text_scene = link.click
      text = text_scene.css('blockquote').map(&:text).map{|text| text.split("\n")}.flatten
      my_data = {
        name: sonnet_names,
        content: text
      }
      data = Sonnet.create(my_data)
    end
  end
end
