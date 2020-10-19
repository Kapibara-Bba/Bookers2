class RenameUserIdColumToRelationships < ActiveRecord::Migration[5.2]
  def change
    rename_column :relationships, :user_id, :followed_id
  end
end
