class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :name
      t.date :date_of_birth
      t.string :status
      t.string :police_abstract_no
      t.string :created_by
      t.string :gender
      t.string :missing_town
      t.string :missing_city
      t.string :additional_info

      t.timestamps
    end
  end
end
