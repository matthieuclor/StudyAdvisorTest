class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.text :french_content
      t.text :piou_content
      t.references :user, index: true
      t.references :tag, index: true
      t.timestamps
    end
  end
end
