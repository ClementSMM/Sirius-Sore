# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "-------------------------------"
puts "Destroying everything"
puts "-------------------------------"

Product.destroy_all
puts "."
User.destroy_all
puts "."
puts "."
Category.destroy_all
puts "."
Stock.destroy_all
puts "."
OrderItem.destroy_all
puts "."
Order.destroy_all

puts "-------------------------------"
puts "Everything is destroyed"
puts "-------------------------------"

puts "-------------------------------"
puts "creating users"
puts "-------------------------------"

louise = User.create!( email: 'lou@email.com', password: 'azerty', admin: true, first_name: 'Louise', last_name: 'Longle', address_1: '22 rue de la Maraude', phone_number: '0667805076', city: 'Lille', post_code: 59000)
puts "."
clement = User.create!( email: 'clem@email.com', password: 'azerty', admin: true, first_name: 'Clement', last_name: 'Saad', address_1: '420 rue de la bibi', phone_number: '0606060606', city: 'Bordeaux', post_code: 33000)
puts "."
random = User.create!( email: 'lambda@email.com', password: 'azerty', admin: false, first_name: 'Ima', last_name: 'ramdom', address_1: '404 rue de nower', phone_number: '0707070707', city: 'Montcuq', post_code: 46800)
puts "."



puts "-------------------------------"
puts "#{User.count} Users created (expected: 3)"
puts "-------------------------------"

puts "-------------------------------"
puts "creating categories"
puts "-------------------------------"

category_1 = Category.create!( name: 'Cosmetiques')
puts "."
category_2 = Category.create!( name: 'Accessoires')
puts "."
category_3 = Category.create!( name: 'Vetements')
puts "."
category_4 = Category.create!( name: 'Gamelles')
puts "."
category_5 = Category.create!( name: 'Friandises')
puts "."
category_6 = Category.create!( name: 'Paniers')
puts "."
category_7 = Category.create!( name: 'Jeux')
puts "."
category_8 = Category.create!( name: 'Transports')
puts "."

puts "-------------------------------"
puts "#{Category.count} Categories created (expected: 8)"
puts "-------------------------------"

puts "-------------------------------"
puts "creating products"
puts "-------------------------------"

shampoing_toutou = Product.new( name: 'Shampoing toudou', small_description: 'tout doux', long_description: 'shampoing tout doux pour les toutou')
shampoing_img = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1617974443/sham_ndpnjh.png')
#shampoing_img2 = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1618220970/doge_qit8ec.jpg')
shampoing_toutou.images.attach(io:shampoing_img, filename: 'images_shampoing.jpg', content_type: 'images/jpg')#shampoing_toutou.images.
#attach(io:shampoing_img2, filename: 'images_shampoing.jpg', content_type: 'images/jpg')
shampoing_toutou.categories << category_1
shampoing_toutou.save
puts "."

collier_bleu = Product.new( name: 'Collier bleu', small_description: "c'est un collier bleu", long_description: "bleu foncé")
collier_img = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1617974444/collier_ig9944.jpg')
collier_bleu.images.attach(io:collier_img, filename: 'images_collier.jpg', content_type: 'images/jpg')
collier_bleu.categories << category_2
collier_bleu.save
puts "."

pull_boxer = Product.new( name: 'Pull boxer', small_description: 'pull-over', long_description: 'pull-over pour boxer')
pull_img = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1617974442/pull_ii4cjw.jpg')
pull_boxer.images.attach(io:pull_img, filename: 'images_pull.jpg', content_type: 'images/jpg')
pull_boxer.categories << category_3
pull_boxer.save
puts "."

gar_gamelle = Product.new( name: 'La gar-gamelle', small_description:'potite gamelle', long_description: 'la gamelle idealle pour les bleu')
gamelle_img = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1617974442/gamelle_j6r7bj.jpg')
gar_gamelle.images.attach(io:gamelle_img, filename: 'images_gamelle.jpg', content_type: 'images/jpg')
gar_gamelle.categories << category_4
gar_gamelle.save
puts "."

fromage = Product.new( name: 'Fromage de fyak', small_description: 'mmmh le fromage de yak', long_description: "fromage moulé au doigt")
fromage_img = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1617974442/fromage_zsfzzr.jpg')
fromage.images.attach(io:fromage_img, filename: 'images_fromage.jpg', content_type: 'images/jpg')
fromage.categories << category_5
fromage.save
puts "."

panier_piano = Product.new( name: 'Panier piano', small_description:'panier en forme de piano', long_description: "Répète le nom du produit 10 fois sans rater et c'est la réduc !")
panier_img = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1617974441/panier_nxwqut.jpg')
panier_piano.images.attach(io:panier_img, filename: 'images_panier.jpg', content_type: 'images/jpg')
panier_piano.categories << category_6
panier_piano.save
puts "."

toutoudou = Product.new( name: 'Toutoudou', small_description:'le doudou du chien ', long_description: 'Un doudou tout doux pour le toutou')
toutoudou_img = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1617974442/doudou_fkjxjg.jpg')
toutoudou.images.attach(io:toutoudou_img, filename: 'images_doudou.jpg', content_type: 'images/jpg')
toutoudou.categories << category_7
toutoudou.save
puts "."

uber_chien = Product.new( name: 'Uber chien', small_description:'Uber mais pour les chiens', long_description: 'Un coup de fil et votre toutou prend la route !')
uber_chien_img = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1617974442/transport_ulwhlc.jpg')
uber_chien.images.attach(io:uber_chien_img, filename: 'images_uber_chien.jpg', content_type: 'images/jpg')
uber_chien.categories << category_8
uber_chien.save
puts "."

puts "-------------------------------"
puts "#{Product.count} products created (expected: 8)"
puts "-------------------------------"

puts "-------------------------------"
puts "creating stocks"
puts "-------------------------------"

shampoing_toutou

stock_shampoing_toutou = Stock.new( size: "500ml", quantity: 23, price: 20)
stock_shampoing_toutou.product = shampoing_toutou
stock_shampoing_toutou.save
puts "."

stock_collier_XL = Stock.new( size: "big doge", quantity: 32, price: 15)
stock_collier_XL.product = collier_bleu
stock_collier_XL.save
puts "."

stock_collier_S = Stock.new( size: 'poti chien', quantity: 450, price: 10 )
stock_collier_S.product = collier_bleu
stock_collier_S.save
puts "."

stock_pull_boxer_S = Stock.new( size: "S comme super petit", quantity: 32, price: 40)
stock_pull_boxer_S.product = pull_boxer
stock_pull_boxer_S.save
puts "."

stock_pull_boxer_M = Stock.new( size: "M comme méga stock", quantity: 5, price: 40)
stock_pull_boxer_M.product = pull_boxer
stock_pull_boxer_M.save
puts "."

stock_gar_gamelle = Stock.new( size: "Taille Unique", quantity: 11, price: 20)
stock_gar_gamelle.product = gar_gamelle
stock_gar_gamelle.save
puts "."


stock_fromage_poti = Stock.new(size: 'potite canine', quantity: 21, price: 4)
stock_fromage_poti.product = fromage
stock_fromage_poti.save
puts "."

stock_fromage_mini = Stock.new(size: 'mini canine', quantity: 2, price: 5)
stock_fromage_mini.product = fromage
stock_fromage_mini.save
puts "."

stock_panier_piano = Stock.new(size: 'Donut poilu', quantity: 10, price: 100)
stock_panier_piano.product = panier_piano
stock_panier_piano.save
puts "."


stock_toutoudou = Stock.new(size: 'Ourson', quantity: 15, price: 30)
stock_toutoudou.product = toutoudou
stock_toutoudou.save
puts "."

stock_uber_chien = Stock.new(size: 'Ferrari N&B', quantity: 15, price: 40)
stock_uber_chien.product = uber_chien
stock_uber_chien.save
puts "."


puts "-------------------------------"
puts "#{Stock.count} stock created (expected: 11)"
puts "-------------------------------"

# puts "-------------------------------"
# puts "creating orders"
# puts "-------------------------------"

# random_order = Order.new
# random_order.user = random
# random_order.save
# random_item_order = OrderItem.new
# random_item_order.product = fromage
# random_item_order.size = 'potite canine'
# random_item_order.quantity = 2
# random_order.order_items << random_item_order
# random_order.save
# puts "."

# userless_order = Order.create!
# userless_item_order = OrderItem.new
# userless_item_order.product = collier_bleu
# userless_item_order.size = 'poti chien'
# userless_item_order.quantity = 3
# userless_order.order_items << userless_item_order
# userless_item_order.save

# userless_item_order2 = OrderItem.new
# userless_item_order2.product = fromage
# userless_item_order2.quantity = 2
# userless_item_order2.size = 'potite canine'
# userless_order.order_items << userless_item_order2
# userless_order.save


# puts "-------------------------------"
# puts "#{OrderItem.count} OrderItem created (expected: 3)"
# puts "-------------------------------"

# puts "-------------------------------"
# puts "#{Order.count} Order created (expected: 2)"
# puts "-------------------------------"
