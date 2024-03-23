class ChangeDefaultApprovedToFalse < ActiveRecord::Migration[7.1]
  def change
    change_column_default :events, :approved, false
  end
end
