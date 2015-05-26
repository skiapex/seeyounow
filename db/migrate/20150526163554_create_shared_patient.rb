class CreateSharedPatient < ActiveRecord::Migration
  def change
    create_table :shared_patients, :id => false  do |t|
      t.integer :clinician_id
      t.integer :patient_id
    end

    add_index :shared_patients, :clinician_id
    add_index :shared_patients, :patient_id
  end
end
