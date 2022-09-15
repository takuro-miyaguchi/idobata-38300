class CreateInformation < ActiveRecord::Migration[6.0]
  def change
    create_table :information do |t|
      t.string     :title      , null: false
      t.integer    :category_id, null: false
      t.string     :image      , null: false
      t.string     :subtitle   , null: false
      t.text       :text       , null: false
      t.references :user       , null: false, foreign_key: true
      t.string     :status     , null: false
      t.timestamps
    end
  end
end
