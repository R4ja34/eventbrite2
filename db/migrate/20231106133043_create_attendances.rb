class CreateAttendances < ActiveRecord::Migration[7.1]
  def change
    create_table :attendances do |t|
      t.string :stripe_customer_id
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :event, index: true, foreign_key: true


      t.timestamps
    end
  end
end
