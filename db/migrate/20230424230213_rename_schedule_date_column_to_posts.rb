class RenameScheduleDateColumnToPosts < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :schedule_date, :start_time
  end
end
