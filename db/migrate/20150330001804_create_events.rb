class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
		
		t.string :address
		t.string :name
		t.text :description
    	t.float :latitude
    	t.float :longitude
    	t.date :date
    	t.time :time

      t.timestamps null: false
    end
  end
end
