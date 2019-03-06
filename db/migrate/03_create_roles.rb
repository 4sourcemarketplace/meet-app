class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.boolean :organizer, default: false
      t.boolean :presenter, default: false
      t.boolean :participant, default: false
      t.timestamps
    end
  end
end
