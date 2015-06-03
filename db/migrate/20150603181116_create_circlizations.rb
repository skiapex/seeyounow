class CreateCirclizations < ActiveRecord::Migration
  def change
    create_table :circlizations do |t|
      t.integer :clinician_id
      t.integer :patient_id
      t.integer :care_group

      t.timestamps
    end
  end
end
