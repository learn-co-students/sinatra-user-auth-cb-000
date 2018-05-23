class CreateUsers < ActiveRecord::Migration[4.2]

  def change
    create_table :Users do |u|
      u.string :name
      u.string :email 
      u.string :password
    end
  end
    
end