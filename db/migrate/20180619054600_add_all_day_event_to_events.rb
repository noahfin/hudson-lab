class AddAllDayEventToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :all_day_event, :boolean
  end
end
