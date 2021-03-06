class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      t.string :title, null: false
      t.text :body
      t.integer :kind, default: 3

      t.timestamps
    end
  end
end
