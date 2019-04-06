class Novel < ApplicationRecord
  require 'mechanize'

  def self.parser
    a = Mechanize.new
    page = a.get("http://shakespeare.mit.edu/")
    novel_links = page.links_with(href: %r{^\w+/index.html})
    novel_names = novel_links.map do |link|
      novel_name = link.click
      name = novel_name.search('td.play').text.split("\n").join
      act_name = novel_name.search('p').text.split("\n").reject(&:empty?)
      scene_links = novel_name.links_with(text: "Entire play")
      texts_scene = scene_links.map do |link|
        text_scene = link.click
        text = text_scene.search('blockquote').text.split("\n").reject(&:empty?)
        my_data = {
          name: name,
          act_name: act_name,
          content: text
        }
        data = Novel.create(my_data)
      end
    end
  end
end
