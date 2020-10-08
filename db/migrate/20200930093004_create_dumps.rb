class CreateDumps < ActiveRecord::Migration[6.0]
  def change
    create_table :dumps do |t|
      t.string :name

      t.timestamps
    end
  end
end
