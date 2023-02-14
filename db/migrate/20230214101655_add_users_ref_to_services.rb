class AddUsersRefToServices < ActiveRecord::Migration[7.0]
  def change
    add_reference :services, :user, null: false, foreign_key: true
  end
end
