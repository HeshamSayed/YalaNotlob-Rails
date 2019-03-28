class AddProviderAndUidForOmniauth < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :provider, :string , limit: 4
  end
end
