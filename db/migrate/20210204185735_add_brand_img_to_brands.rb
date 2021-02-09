class AddBrandImgToBrands < ActiveRecord::Migration[6.0]
 def change
    add_column :brands, :brand_img, :string
  end
end
