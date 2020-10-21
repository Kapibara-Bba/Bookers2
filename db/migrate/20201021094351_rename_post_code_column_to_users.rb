class RenamePostCodeColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :post_code, :postal_code
  end
end
