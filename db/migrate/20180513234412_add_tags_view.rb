class AddTagsView < ActiveRecord::Migration[5.1]

	def up
	    execute "CREATE VIEW alltags AS SELECT * FROM tags" 
	end

	def down
			execute "DROP VIEW alltags"
	end
  
end
