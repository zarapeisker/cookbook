# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "open-uri"

#def collect
  recipes = ["apple_chicken_quesadilla", "african_chicken_peanut_stew", "apricot_chicken", "arroz_con_pollo"]
  recipes.each do |recipe|
      recipe = Nokogiri::HTML(open("http://www.simplyrecipes.com/recipes/#{recipe}/"))
      description = recipe.css(".recipe-description p")[0].content
      title = recipe.css(".entry-title")[0].content
      Recipe.create(:title => title, :description => description)
  end
#end

@twilio_client = Twilio::REST::Client.new(
  "AC79d251f9e5aecc4540eed6c3de0877cd",
  "f87a93df444367acf7f497420e753a63"
)

#if collect
  @twilio_client.account.sms.messages.create(
    :from => '+19044946142',
    :to => '+19043779122',
    :body => "Your database has been updated!"
  )
#end








