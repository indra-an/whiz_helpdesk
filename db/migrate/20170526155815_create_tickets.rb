class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :number
      t.string :subject
      t.text :description
      t.string :client_number
      t.references :user, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
