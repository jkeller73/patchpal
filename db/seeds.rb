# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
HarvestMonth.destroy_all
PatchPlant.destroy_all
Patch.destroy_all
User.destroy_all
Plant.destroy_all
DailyWeatherReport.destroy_all

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

vegetable_suffixes = ['tomato-supersweet/txz61714TM', 'carrot-mokum-f1-hybrid/760TM', 'parsnip-white-gem/tst00985TM', 'leek-nipper/tt01093TM', 'onion-supasweettrade-dulcinea-f1-hybrid/997TM', 'onion-red-baron/825TM',
'courgette-all-green-bush/554TM', 'pumpkin-jack-of-all-trades/630TM', 'squash-avalon-f1-hybrid-winter/951TM',
'broccoli-spiridon-f1-hybrid-calabrese/4782TM', 'brussels-sprout-bosworth-f1-hybrid/696TM', 'cabbage-brigadier-f1-hybrid-autumnwinter/83TM',
'kale-midnight-sun/tm60213TM', 'swiss-chard-fantasy/gww4969TM', 'beetroot-kestrel-f1-hybrid-globe/534TM',
'sweet-pepper-gourmet/62TM', 'chilli-pepper-hot-thai/tm75329TM','pea-ceresa-petit-pois/gww4786TM',
'broad-bean-jubilee-hysor/802TM','parsley-laura/862TM', 'basil-christmas/4886TM', 'coriander/481TM',
'lettuce-sweet-success-icebergromaine/TT50586TM', 'radish-mars-f1-hybrid/tr54728TM', 'cucumber-diva/TT52081TM', 'lettuce-winter-gem-cos/999TM', 'broad-bean-aquadulce-claudia/138TM']

plant_images = ['tomato.png', 'carrots.png', 'parsnip.jpg', 'leek.png', 'onionwhite.png', 'onionred.png', 'courgette.jpg', 'pumpkin.png', 'squash.jpg', 'broccoli.png', 'brusselsprouts.png', 'cabbage.png', 'kale.png', 'swisschard.png', 'beetroot.png', 'sweetpepper.png', 'chillipepper.png', 'peas.jpg', 'broadbean.jpg', 'parsley.jpg', 'basil.jpg', 'coriander.jpg', 'lettuces.jpg', 'radish.png', 'cucumber.png', 'lettuces.jpg', 'broadbean.jpg']

array = []
vegetable_suffixes.each do |suffix|
  # Description Tab
  # Vegetable.create(scrape(suffix))
  url = "https://www.thompson-morgan.com/p/#{suffix}"
  array << url
end

# def scrape(suffix)
counter = 0
array.each do |url|
  description = ''
  hardiness = ''
  position_in = ''
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  results = {}
  months_sowing = []
  months_harvest = []
  html_doc.search('#description').each do |element|
    description = element.search('.description').text.strip
    hardiness = element.search("label:contains('Hardiness') + span").text.strip
    position_in = element.search("label:contains('Position In') + span").text.strip
    results = {
      description: description,
      hardiness: hardiness,
      position_in: position_in,
      name: url.split("/p/").last.split("-").first,
      photo: plant_images[counter]
    }
  counter += 1
  end
  html_doc.search('#sowing').each do |element|
    results[:sowing] = element.text.strip
  end
  html_doc.search('#info').each do |element|
    results[:more_info] = element.text.strip
  end

  # results[:photo] = html_doc.search('.mainImage img').first['data-src']
  plant = Plant.create!(results)
  puts plant.photo



  html_doc.search('.periods .sowing').each do |element|
    months_sowing << element.text.strip
  end
  html_doc.search('.periods .harvest').each do |element|
    months_harvest << element.text.strip
  end

  month_hash = {
    :jan => false,
    :feb => false,
    :mar => false,
    :apr => false,
    :may => false,
    :jun => false,
    :jul => false,
    :aug => false,
    :sep => false,
    :oct => false,
    :nov => false,
    :dec => false
  }

  months_sowing.each do |month|
    month_hash[month.downcase.to_sym] = true
  end

  month_hash[:plant] = plant

  SowingMonth.create!(month_hash)

  har_month_hash = {
    :jan => false,
    :feb => false,
    :mar => false,
    :apr => false,
    :may => false,
    :jun => false,
    :jul => false,
    :aug => false,
    :sep => false,
    :oct => false,
    :nov => false,
    :dec => false
  }

  puts 'new plant'
  months_harvest.each do |month|
    har_month_hash[month.downcase.to_sym] = true
  end

  har_month_hash[:plant] = plant

  HarvestMonth.create!(har_month_hash)
end


r = User.create!(first_name: 'Robin', last_name: 'Hood', email: 'hoodrobin@gmail.com', password: '123123')
a = Patch.create!(name: 'My Autumn Patch', address: 'Acton, England, United Kingdom', user: r)
5.times { PatchPlant.create!(patch: a, plant: Plant.all.sample)}
hm = HarvestMonth.where(dec: true).first
PatchPlant.create!(patch: a, plant: hm.plant, plant_date: 31.weeks.ago)
sm = SowingMonth.where(dec: true).first
PatchPlant.create!(patch: a, plant: sm.plant)


# DailyWeatherReport.create!(date: 3.days.ago, description: 'sunny', temperature: 10.4, patch: pat)
# DailyWeatherReport.create!(date: 2.days.ago, description: 'clouds', temperature: 9.34, patch: pat)
# DailyWeatherReport.create!(date: 1.day.ago, description: 'fog and rainy', temperature: 12.56, patch: pat)











