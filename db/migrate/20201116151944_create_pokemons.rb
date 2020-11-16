class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :type
      t.text :description
      t.integer :level

      t.timestamps
    end
  end
end
