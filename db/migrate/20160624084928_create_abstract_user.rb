class CreateAbstractUser < ActiveRecord::Migration
  def change
    create_table :skuid_users do |t|
      t.string :name
      t.integer :age
      t.string :type

      t.timestamps null: false
    end
  end
end
