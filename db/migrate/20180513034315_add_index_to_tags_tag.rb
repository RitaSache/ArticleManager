class AddIndexToTagsTag < ActiveRecord::Migration[5.1]
  def change
  	add_index :tags, :tag
  end
end
