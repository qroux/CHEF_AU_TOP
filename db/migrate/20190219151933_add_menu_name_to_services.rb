class AddMenuNameToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :menu_name, :string
  end
end
