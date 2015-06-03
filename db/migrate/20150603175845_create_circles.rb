class CreateCircles < ActiveRecord::Migration
  def change
    create_table :circles do |t|
      t.integer :clinician_id
      t.integer :patient_id
      t.integer :care_group

      t.timestamps
    end
  end
end
