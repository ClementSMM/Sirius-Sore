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

OrderItem.destroy_all
puts "."
ProductCategory.destroy_all
puts "."
Order.destroy_all
puts "."
Stock.destroy_all
puts "."
Category.destroy_all
puts "."
Product.destroy_all
puts "."
User.destroy_all
puts "."
Gallery.destroy_all
puts "."

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
rick = User.create!( email: 'ricky@email.com', password: 'azerty', admin: false, first_name: 'Ricky', last_name: 'Trailer', address_1: 'In my car', address_2: 'Trailer Park', phone_number: '0707070707', city: 'Toronto', post_code: 46800)
puts "."



puts "-------------------------------"
puts "#{User.count} Users created (expected: 3)"
puts "-------------------------------"

puts "-------------------------------"
puts "creating categories"
puts "-------------------------------"

category_1 = Category.create!( name: 'Nouveautés')
puts "."
category_2 = Category.create!( name: 'Editions Limitées')
puts "."
category_3 = Category.create!( name: 'Dernières pièces')
puts "."
category_4 = Category.create!( name: 'Shampoings')
puts "."
category_5 = Category.create!( name: 'Après-shampoings')
puts "."
category_6 = Category.create!( name: 'Conditionners')
puts "."
category_7 = Category.create!( name: 'Parfums')
puts "."
category_8 = Category.create!( name: 'Outils de toilettage')
puts "."
category_9 = Category.create!( name: 'Bois de cerf')
puts "."
category_10 = Category.create!( name: 'Bâton de yak')
puts "."
category_11 = Category.create!( name: 'Friandises deshydratées')
puts "."
category_12 = Category.create!( name: 'Colliers')
puts "."
category_13 = Category.create!( name: 'Harnais')
puts "."
category_14 = Category.create!( name: 'Laisses')
puts "."
category_15 = Category.create!( name: 'Bandanas')
puts "."
category_16 = Category.create!( name: 'Médailles')
puts "."
category_17 = Category.create!( name: 'Pochettes')
puts "."
category_18 = Category.create!( name: 'Paniers Sirius')
puts "."
category_19 = Category.create!( name: 'Coussins')
puts "."
category_20 = Category.create!( name: 'Orthopédique')
puts "."
category_21 = Category.create!( name: 'Canapés')
puts "."
category_22 = Category.create!( name: 'Pulls')
puts "."
category_23 = Category.create!( name: 'Manteaux')
puts "."
category_24 = Category.create!( name: 'T-shirts')
puts "."
category_25 = Category.create!( name: 'Autres')
puts "."
category_26 = Category.create!( name: 'Doudous')
puts "."
category_27 = Category.create!( name: 'Pour les dents')
puts "."
category_28 = Category.create!( name: 'Gamelles Sirius')
puts "."
category_29 = Category.create!( name: 'Gamelles')
puts "."
category_30 = Category.create!( name: 'Gamelles anti-glouton')
puts "."
category_31 = Category.create!( name: 'Sacs de transport')
puts "."
category_32 = Category.create!( name: 'Poussettes')
puts "."
category_33 = Category.create!( name: 'Sécurité')
puts "."

puts "-------------------------------"
puts "#{Category.count} Categories created (expected: 33)"
puts "-------------------------------"

puts "-------------------------------"
puts "creating products"
puts "-------------------------------"

shampoing_toutou = Product.new( name: 'Shampoing toudou', small_description: 'tout doux', long_description: 'shampoing tout doux pour les toutou')
shampoing_img = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1617974443/Base%20seeds/sham_ndpnjh.png')
shampoing_toutou.images.attach(io:shampoing_img, filename: 'images_shampoing.jpg', content_type: 'images/jpg')#shampoing_toutou.images.
#attach(io:shampoing_img2, filename: 'images_shampoing.jpg', content_type: 'images/jpg')
shampoing_toutou.categories << category_4
shampoing_toutou.save
puts "."

collier_bleu = Product.new( name: 'Collier bleu', small_description: "c'est un collier bleu", long_description: "bleu foncé")
collier_img = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1617974444/Base%20seeds/collier_ig9944.jpg')
collier_bleu.images.attach(io:collier_img, filename: 'images_collier.jpg', content_type: 'images/jpg')
collier_bleu.categories << category_12
collier_bleu.save
puts "."

pull_boxer = Product.new( name: 'Pull boxer', small_description: 'pull-over', long_description: 'pull-over pour boxer')
pull_img = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1617974442/Base%20seeds/pull_ii4cjw.jpg')
pull_boxer.images.attach(io:pull_img, filename: 'images_pull.jpg', content_type: 'images/jpg')
pull_boxer.categories << category_22
pull_boxer.categories << category_1
pull_boxer.categories << category_2
pull_boxer.save
puts "."

gar_gamelle = Product.new( name: 'La gar-gamelle', small_description:'potite gamelle', long_description: 'la gamelle idealle pour les bleu')
gamelle_img = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1617974442/Base%20seeds/gamelle_j6r7bj.jpg')
gar_gamelle.images.attach(io:gamelle_img, filename: 'images_gamelle.jpg', content_type: 'images/jpg')
gar_gamelle.categories << category_29
gar_gamelle.save
puts "."

panier_piano = Product.new( name: 'Panier piano', small_description:'panier en forme de piano', long_description: "Répète le nom du produit 10 fois sans rater et c'est la réduc !")
panier_img = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1617974441/Base%20seeds/panier_nxwqut.jpg')
panier_piano.images.attach(io:panier_img, filename: 'images_panier.jpg', content_type: 'images/jpg')
panier_piano.categories << category_19
panier_piano.save
puts "."

toutoudou = Product.new( name: 'Toutoudou', small_description:'le doudou du chien ', long_description: 'Un doudou tout doux pour le toutou')
toutoudou_img = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1617974442/Base%20seeds/doudou_fkjxjg.jpg')
toutoudou.images.attach(io:toutoudou_img, filename: 'images_doudou.jpg', content_type: 'images/jpg')
toutoudou.categories << category_26
toutoudou.save
puts "."

uber_chien = Product.new( name: 'Uber chien', small_description:'Uber mais pour les chiens', long_description: 'Un coup de fil et votre toutou prend la route !')
uber_chien_img = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1617974442/Base%20seeds/transport_ulwhlc.jpg')
uber_chien.images.attach(io:uber_chien_img, filename: 'images_uber_chien.jpg', content_type: 'images/jpg')
uber_chien.categories << category_31
uber_chien.save
puts "."

poussette = Product.new( name: 'Poussette de compet', small_description:'Grande poussette pour courir avec son chien', long_description: 'Idéal pour le transport de toutous plus agés. Existe en 2 formats.  ')
poussette_img = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1619089695/Base%20seeds/poussette_uyk4kf.jpg')
poussette2_img = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1619089692/Base%20seeds/poussette-grande_js5dpo.jpg')
poussette.images.attach(io:poussette_img, filename: 'poussette-rouge.jpg', content_type: 'images/jpg')
poussette.images.attach(io:poussette2_img, filename: 'poussette-poid-loud.jpg', content_type: 'images/jpg')
poussette.categories << category_32
poussette.save
puts "."

panier_snug = Product.new( name: 'Panier snug Botanical garden', small_description:'Panier orthopédique pour chiens de haute qualité', long_description: 'Mousse orthopédique, résistant aux tâches, lavable à 30 degrés')
panier_snug_img = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1619089695/Base%20seeds/poussette_uyk4kf.jpg')
panier_snug.images.attach(io:panier_snug_img, filename: 'panier-ortho.jpg', content_type: 'images/jpg')
panier_snug.categories << category_20
panier_snug.categories << category_1
panier_snug.save
puts "."

shampoing_banane = Product.new( name: 'Shampoing banane SLS free', small_description:"Pour chien et chats à poils texturés doubles ou mi-longs. L'action enrichissante rend l'élasticité du poil qui devient doux et brillant", long_description: "Mode d'emploi : Mouiller le pelage à l'eau tiède, diluer le shampoing avec de l'eau chaude et frictionner légèrement le sgampoing sur l'animal/Laisser agir quelques minutes et bien rincer. Conseil pour un meilleur résultat : utiliser l'après shampoing banane.")
shampoing_banane_img = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1619090497/Base%20seeds/shampoing_tldiac.jpg')
shampoing_banane.images.attach(io:shampoing_banane_img, filename: 'shampoing-banane.jpg', content_type: 'images/jpg')
shampoing_banane.categories << category_4
shampoing_banane.save

puts "-------------------------------"
puts "#{Product.count} products created (expected: 11)"
puts "-------------------------------"

puts "-------------------------------"
puts "creating stocks"
puts "-------------------------------"

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

stock_poussette = Stock.new(size: 'Rouge', quantity: 10, price: 55)
stock_poussette.product = poussette
stock_poussette.save
puts "."

stock_poussette = Stock.new(size: 'Bleu et violet', quantity: 10, price: 55.5)
stock_poussette.product = poussette
stock_poussette.save
puts "."

stock_panier_snug = Stock.new(size: "Taille unique", quantity: 10, price: 65)
stock_panier_snug.product = panier_snug
stock_panier_snug .save
puts "."

stock_shampoing_banane = Stock.new(size: "450ml", quantity: 5, price: 85)
stock_shampoing_banane.product = shampoing_banane
stock_shampoing_banane.save
puts "."





puts "-------------------------------"
puts "#{Stock.count} stock created (expected: 13)"
puts "-------------------------------"

puts "-------------------------------"
puts "creating galleries"
puts "-------------------------------"


gallery_1 = Gallery.create!( category: 'Bannière')
gallery_1_img = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1619543984/Base%20seeds/Capture_d_e%CC%81cran_2021-04-27_a%CC%80_18.57.06_x9ybgc.png')
gallery_1.images.attach(io:gallery_1_img, filename: 'image_banner.jpg', content_type: 'images/jpg')
gallery_1.save

puts "."


# oui il manque la 2 mais c'était une erreur

puts "."
gallery_3 = Gallery.create!( category: 'Cosmétiques')
gallery_3_img = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1619703264/Base%20seeds/cosmetique_tnadyy.jpg')
gallery_3.images.attach(io:gallery_3_img, filename: 'image_banner.jpg', content_type: 'images/jpg')
gallery_3.save

puts "."
gallery_4 = Gallery.create!( category: 'Friandises')
gallery_4_img = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1619703264/Base%20seeds/friandise_d0yw0l.jpg')
gallery_4.images.attach(io:gallery_4_img, filename: 'image_banner.jpg', content_type: 'images/jpg')
gallery_4.save

puts "."
gallery_5 = Gallery.create!( category: 'Accessoires')
gallery_5_img = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1619703265/Base%20seeds/bandana_qq0ox8.jpg')
gallery_5.images.attach(io:gallery_5_img, filename: 'image_banner.jpg', content_type: 'images/jpg')
gallery_5.save

puts "."
gallery_6 = Gallery.create!( category: 'Paniers')
gallery_6_img = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1619703264/Base%20seeds/panier_vaw0fj.jpg')
gallery_6.images.attach(io:gallery_6_img, filename: 'image_banner.jpg', content_type: 'images/jpg')
gallery_6.save

puts "."
gallery_7 = Gallery.create!( category: 'Vêtements')
gallery_7_img = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1619703264/Base%20seeds/vetement_pu3vtr.jpg')
gallery_7.images.attach(io:gallery_7_img, filename: 'image_banner.jpg', content_type: 'images/jpg')
gallery_7.save

puts "."
gallery_8 = Gallery.create!( category: 'Jeux')
gallery_8_img = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1619703265/Base%20seeds/jouet_uff6kp.jpg')
gallery_8.images.attach(io:gallery_8_img, filename: 'image_banner.jpg', content_type: 'images/jpg')
gallery_8.save

puts "."
gallery_9 = Gallery.create!( category: 'Gamelles')
gallery_9_img = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1619703265/Base%20seeds/gamelle_sjip2c.jpg')
gallery_9.images.attach(io:gallery_9_img, filename: 'image_banner.jpg', content_type: 'images/jpg')
gallery_9.save

puts "."
gallery_10 = Gallery.create!( category: 'Transports')
gallery_10_img = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1619703265/Base%20seeds/transport_exx9qe.png')
gallery_10.images.attach(io:gallery_10_img, filename: 'image_banner.jpg', content_type: 'images/jpg')
gallery_10.save

puts "."
gallery_11 = Gallery.create!( category: 'logo_grand')
gallery_11_img = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1619703861/Base%20seeds/Logocouleur_nom-_fond_transparent_1_1_eqc2cf.png')
gallery_11.images.attach(io:gallery_11_img, filename: 'image_banner.jpg', content_type: 'images/jpg')
gallery_11.save

puts "."
gallery_12 = Gallery.create!( category: 'logo_petit')
gallery_12_img = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1619703993/Base%20seeds/logo_petit_lwysur.png')
gallery_12.images.attach(io:gallery_12_img, filename: 'image_banner.jpg', content_type: 'images/jpg')
gallery_12.save

puts "."

gallery_13 = Gallery.create!( category: 'salon')
gallery_13_img = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1619784963/Base%20seeds/zimba_qokx21.jpg')
gallery_13.images.attach(io:gallery_13_img, filename: 'image_banner.jpg', content_type: 'images/jpg')
gallery_13_img2 = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1619784959/Base%20seeds/zarko_hter5y.jpg')
gallery_13.images.attach(io:gallery_13_img2, filename: 'image_banner.jpg', content_type: 'images/jpg')

gallery_13.save
puts "."

gallery_14 = Gallery.create!( category: 'about')
gallery_14_img1 = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1619773542/Base%20seeds/JB7B2845_egno9q.jpg')
gallery_14_img2 = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1619773539/Base%20seeds/JB7B2395-2NON_agfzyu.jpg')
gallery_14_img3 = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1619773548/Base%20seeds/119709737_473049203669465_8535558611021112864_n_kdo8zo.jpg')
gallery_14_img4 = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1619773544/Base%20seeds/180219641_2955578414718644_4206740040203712725_n_b5fprd.jpg')
gallery_14.images.attach(io:gallery_14_img1, filename: 'image_banner.jpg', content_type: 'images/jpg')
gallery_14.images.attach(io:gallery_14_img2, filename: 'image_banner.jpg', content_type: 'images/jpg')
gallery_14.images.attach(io:gallery_14_img3, filename: 'image_banner.jpg', content_type: 'images/jpg')
gallery_14.images.attach(io:gallery_14_img4, filename: 'image_banner.jpg', content_type: 'images/jpg')
gallery_14.save
puts "."

gallery_15 = Gallery.create!( category: 'homepage')
gallery_15_img1 = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1619773542/Base%20seeds/JB7B2845_egno9q.jpg')
gallery_15_img2 = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1619773539/Base%20seeds/JB7B2395-2NON_agfzyu.jpg')
gallery_15_img3 = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1619773548/Base%20seeds/119709737_473049203669465_8535558611021112864_n_kdo8zo.jpg')
gallery_15_img4 = URI.open('https://res.cloudinary.com/maison-sirius/image/upload/v1619773544/Base%20seeds/180219641_2955578414718644_4206740040203712725_n_b5fprd.jpg')
gallery_15.images.attach(io:gallery_15_img1, filename: 'image_banner.jpg', content_type: 'images/jpg')
gallery_15.images.attach(io:gallery_15_img2, filename: 'image_banner.jpg', content_type: 'images/jpg')
gallery_15.images.attach(io:gallery_15_img3, filename: 'image_banner.jpg', content_type: 'images/jpg')
gallery_15.images.attach(io:gallery_15_img4, filename: 'image_banner.jpg', content_type: 'images/jpg')
gallery_15.save

puts "-------------------------------"
puts "#{Gallery.count} galleries created (expected: 15)"
puts "-------------------------------"
