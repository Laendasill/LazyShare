class CreateReacts < ActiveRecord::Migration
  def change
    create_table :reacts do |t|
      t.string :name

      t.timestamps
    end
  end
end
