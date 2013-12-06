class CreateCauses < ActiveRecord::Migration
  def change
    create_table :causes do |t|
      t.string :cause_name

      t.timestamps
    end
  end
end
