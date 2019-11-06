class CreateUsers < ActiveRecord::Migration
  # why did I get all kinds of errors with the [4.2] added to above, thought that was required??

  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
    end
  end

end
