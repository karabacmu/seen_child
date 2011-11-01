class ChangeDataTypeForColumn < ActiveRecord::Migration
  def up
    change_table :children do |t|
       t.change :additional_info, :text
    end
  end

  def down
    change_table :children do |t|
      t.change :additional_info, :string
    end
  end
end
