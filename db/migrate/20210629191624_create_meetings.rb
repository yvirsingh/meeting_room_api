class CreateMeetings < ActiveRecord::Migration[6.1]
  def change
    create_table :meetings do |t|
      t.string :title
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.integer :number_of_attendes
      t.text :agenda
      t.integer :status

      t.timestamps
    end
  end
end
