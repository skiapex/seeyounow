class CreateCliniciansPatientsJoin < ActiveRecord::Migration
  def change
    create_table :clinicians_patients, :id => false do |t|
    	t.column 'clinician_id', :integer
    	t.column 'patient_id', :integer
    end
  end
end
