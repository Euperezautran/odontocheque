# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Deleting all the db"
Product.destroy_all
Brand.destroy_all
Cheque.destroy_all
puts '------------------------------------------'
puts 'start seed'
puts 'creating brand'
sensodyne = Brand.create!(name: 'sensodyne/logo sensodyne.png')
corega = Brand.create!(name: 'corega/logo corega.png')
parodontax = Brand.create!(name: 'parodontax/logo parodontax.png')
puts '------------------------------------------'
puts 'creating products'
PRODUCT_SENSODYNE = ['sensodyne/SDY_TRUE_WHITE.jpg', 'sensodyne/Cepillo RA Nitro violeta.jpg', 'sensodyne/GSK_GEP_WLA_3.png', 'sensodyne/SDY Proesmalte Kids.jpg', 'sensodyne/sdy_cool-mint_enjuague_250ml-2.jpg', 'sensodyne/SDY_LIMPIEZA_PROFUNDA_90g_B.jpg','sensodyne/SDY_MP.png', 'sensodyne/SDY_PROESMALTE_BLANQUEADOR_90g_B.jpg', 'sensodyne/SDY_REPARA_PROTEGE_BLANQ_B.jpg', 'sensodyne/SDY_TW.png']
PRODUCT_SENSODYNE.each do |product|
  Product.create!(
    name: product,
    brand_id: sensodyne.id)
end
PRODUCT_COREGA = ['corega/CGA Menta 40g.jpg', 'corega/CGA Sin Sabor 40g.jpg', 'corega/CGA Tabs 3 min 30u.jpg', 'corega/CGA Tabs Blanqueador 30u.jpg']
  PRODUCT_COREGA.each do |product|
  Product.create!(
      name: product,
      brand_id: corega.id)
  end
PRODUCT_PARODONTAX = ['parodontax/CEPILLO PDX.jpg', 'parodontax/PARODONTAX COMPLETE-Limpio.jpg','parodontax/PDX Blanqueador 116g.jpg', 'parodontax/PDX Fluor 90g BAJA.jpg']
PRODUCT_PARODONTAX.each do |product|
    Product.create!(
      name: product,
      brand_id: parodontax.id
    )
  end
puts '-------------------------------------------'
puts 'creating cheque numbres'
NUMEROS_DE_CHEQUE = 10.times.map{ Random.rand(100000...900000) }
NUMEROS_DE_CHEQUE.each do |numero_de_cheque|
  Cheque.create!(
    numero: numero_de_cheque,
    user_id: @user,
    product_id: @product
  )
end
puts '-------------------------------------------'
puts 'end seed'
