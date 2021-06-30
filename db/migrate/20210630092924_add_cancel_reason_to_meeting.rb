class AddCancelReasonToMeeting < ActiveRecord::Migration[6.1]
  def change
    add_column :meetings, :cancel_reason, :text
  end
end
