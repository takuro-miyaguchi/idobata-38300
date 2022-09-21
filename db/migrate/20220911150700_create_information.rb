class CreateInformation < ActiveRecord::Migration[6.0]
  def change
    create_table :information do |t|
      t.string     :title      , null: false
      t.integer    :category   , null: false
      t.string     :images
      t.text       :text       , null: false
      t.references :user       , null: false, foreign_key: true
      t.integer    :status     , null: false, default: 0
      t.timestamps
    end
  end
end
