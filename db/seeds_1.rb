# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'open-uri'
require 'nokogiri'
require 'json'


def without_jpg(name)
  name.split(".").delete_if {|i| i == "jpg"}.join("").split("_").join(" ")
end


#

#fungummy
@a=Dir.entries("picture").select {|f| !File.directory? f} 
  @a.each do |a|
    convert=a.split(".").delete_if {|i| i == "jpg"}.join("_")
    domen="http://www.fungoomy.com/"

      url = "#{domen}/gameinf/#{convert}"
      html = open(url)

      doc = Nokogiri::HTML(html)

      #description fungummy
      description=doc.css('#description span')
      #description zeze
      #description=doc.css('#description span')
      #category fun
      category=doc.css('.moinf2 p a').map { |tag| tag.text.strip }
      #category zeze
      #category=doc.css('.moinf2 p a').map { |tag| tag.text.strip }
      #rating 
      #rating=doc.css('.moinf2 p span').map { |tag| tag.text.strip }

      @film=Film.create(title: without_jpg("#{a}").titleize, description: "#{description}".gsub(/<\/?[^>]+>/, ''), uploaded_file: File.new("picture/#{a}"))
      category.each do |category|  
      CategoryFilm.create(category_of_game: ActionView::Base.full_sanitizer.sanitize(category), film_id: @film.id)  
  end
end
#category: category.join(" ")
#monster_high, super_mario, dress_up, angry_birds,little_pony






#category
def count_of_game(category)
  @count=Film.where(category: category).count
  return @count
end

@category=Dir.entries("public/category").select {|f| !File.directory? f}
@category.each do |category|
  name=category.split(".").delete_if {|i| i == "jpg"}.join("").split("_").join(" ")
  Category.create(count_game: count_of_game(name), category: "#{name}".titleize, upload_picture: File.new("public/category/#{category}"))
end

