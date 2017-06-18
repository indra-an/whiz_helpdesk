class AddParentIdToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :parent_id, :integer
  end
end
