class AddDesCriptionToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :description, :text
  end
end
