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


#category
@category=Dir.entries("public/category").select {|f| !File.directory? f}
@category.each do |category|
  name=category.split(".").delete_if {|i| i == "jpg"}.join("").split("_").join(" ")
  Category.create(category: "#{name}".titleize, upload_picture: File.new("public/category/#{category}"))
end







@a=Dir.entries("picture").select {|f| !File.directory? f} 
@a.each do |a|





  convert=a.split(".").delete_if {|i| i == "jpg"}.join("_")
url = "http://www.fungoomy.com/gameinf/#{convert}"
html = open(url)

doc = Nokogiri::HTML(html)

#description
description=doc.css('#description span')
#category
category=doc.css('.moinf2 p a').map { |tag| tag.text.strip }
#rating 
rating=doc.css('.moinf2 p span').map { |tag| tag.text.strip }

  Film.create(played: 0, rating: rating.last, title: without_jpg("#{a}").titleize, category: category.join(" "), description: "#{description}".delete("<span>").delete("/"), uploaded_file: File.new("picture/#{a}"), down_file: File.new("swf/#{a}".split(".").delete_if {|i| i == "jpg"}.join("")+'.swf'))
end
