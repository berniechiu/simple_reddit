class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.timestamps
      t.string :email
      t.string :username
    end
  end
end
