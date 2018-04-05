class User < ActiveRecord::Migration
  validates :name, :email, :password, :presence => true

  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
    end
  end
end
