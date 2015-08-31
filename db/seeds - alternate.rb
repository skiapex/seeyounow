# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Deletes everything from the database so that you start fresh
puts "Deleting all records from the database..."
puts "Deleting all User from the database..."
User.delete_all
puts "Deleting all Clinician from the database..."
Clinician.delete_all
puts "Deleting all Patient from the database..."
Patient.delete_all
puts "Deleting all Gender from the database..."
Gender.delete_all
puts "Deleting all Inputter from the database..."
Inputter.delete_all
puts "Deleting all EsasAssessment from the database..."
EsasAssessment.delete_all
puts "Deleting all PrfsAssessment from the database..."
PrfsAssessment.delete_all
puts "Deleting all Comment from the database..."
Comment.delete_all
puts "Deleting all Note from the database..."
Note.delete_all
puts "Deleting all NotificationSetting from the database..."
NotificationSetting.delete_all
puts "Deleting all CareGroup from the database..."
CareGroup.delete_all
puts "Deleting all OtherSymptom from the database..."
OtherSymptom.delete_all
puts "Deleting all Occupation from the database..."
Occupation.delete_all
puts "Deleting all Speciality from the database..."
Speciality.delete_all


puts "Creating gender types..."
# Create different possible genders
male = Gender.create(gender_type: "male")
female = Gender.create(gender_type: "female")
transgender = Gender.create(gender_type: "transgender")

puts "Creating additional symptom types..."
# Create different symptom types
none = OtherSymptom.create(symptom_type: "none")
constipation = OtherSymptom.create(symptom_type: "constipation")
sweating = OtherSymptom.create(symptom_type: "sweating")
urine = OtherSymptom.create(symptom_type: "discoloured urine")
respiratorycongestion = OtherSymptom.create(symptom_type: "respiratory congestion")
drymouth = OtherSymptom.create(symptom_type: "dry mouth")
hiccups = OtherSymptom.create(symptom_type: "hiccups")
anorexiacachexia = OtherSymptom.create(symptom_type: "anorexia–cachexia")
diarrhea = OtherSymptom.create(symptom_type: "diarrhea")
delirium = OtherSymptom.create(symptom_type: "delirium")
insomnia = OtherSymptom.create(symptom_type: "insomnia")
terminalrestlessness = OtherSymptom.create(symptom_type: "terminal restlessness")
vomiting = OtherSymptom.create(symptom_type: "vomiting")

puts "Creating inputter types..."
# Create different possible inputter types
partner = Inputter.create(inputter_type: "Partner")
son = Inputter.create(inputter_type: "Son")
daughter = Inputter.create(inputter_type: "Daughter")
grandchild = Inputter.create(inputter_type: "Grandchild")
mother = Inputter.create(inputter_type: "Mother")
father = Inputter.create(inputter_type: "Father")
friend = Inputter.create(inputter_type: "Friend")
patient = Inputter.create(inputter_type: "Patient")
clinician = Inputter.create(inputter_type: "Medical team")
care_aid = Inputter.create(inputter_type: "Care aid")

puts "Creating occupations..."
# Create different occupations
physician = Occupation.create(name: "Physician", pronym: "Dr.", acronym: nil)
rn = Occupation.create(name: "Registered Nurse", pronym: nil, acronym: "RN")
nursepractitioner = Occupation.create(name: "Nurse Practitioner", pronym: nil, acronym: "NP")
rpn = Occupation.create(name: "Registered Practical Nurse", pronym: nil, acronym: "RPN")
physiotherapist = Occupation.create(name: "Physiotherapist", pronym: nil, acronym: "PT")
dietician = Occupation.create(name: "Dietician", pronym: nil, acronym: nil)
social = Occupation.create(name: "Social Worker", pronym: nil, acronym: nil)
ot = Occupation.create(name: "Occupational Therapist", pronym: nil, acronym: "OT")
lpn = Occupation.create(name: "Licensed Practical Nurse", pronym: nil, acronym: "LPN")
rpsyn = Occupation.create(name: "Registered Psychiatric Nurse", pronym: nil, acronym: "RPN")

puts "Creating specialities..."
# Create different specialist physicians
gp = Speciality.create(name: "General Practitioner", occupation_id: physician.id)
anesthetist = Speciality.create(name: "Anesthetist", occupation_id: physician.id)
cardiologist = Speciality.create(name: "Cardiologist", occupation_id: physician.id)
immunologist = Speciality.create(name: "Clinical Immunologist-allergist", occupation_id: physician.id)
dermatologist = Speciality.create(name: "Dermatologist", occupation_id: physician.id)
radiologist = Speciality.create(name: "Diagnostic Radiologist", occupation_id: physician.id)
emergency = Speciality.create(name: "Emergency Physician", occupation_id: physician.id)
endocrinologist = Speciality.create(name: "Endocrinologist", occupation_id: physician.id)
gastroenterologist = Speciality.create(name: "Gastroenterologist", occupation_id: physician.id)
geriatrician = Speciality.create(name: "Geriatrician", occupation_id: physician.id)
hematologist = Speciality.create(name: "Hematologist", occupation_id: physician.id)
nephrologist = Speciality.create(name: "Nephrologist", occupation_id: physician.id)
neurologist = Speciality.create(name: "Neurologist", occupation_id: physician.id)
oncologist = Speciality.create(name: "Oncologist", occupation_id: physician.id)
orthopedist = Speciality.create(name: "Orthopedist", occupation_id: physician.id)
pediatrician = Speciality.create(name: "Pediatrician", occupation_id: physician.id)
physiatrist = Speciality.create(name: "Physiatrist", occupation_id: physician.id)
pneumologist = Speciality.create(name: "Pneumologist", occupation_id: physician.id)
psychiatrist = Speciality.create(name: "Psychiatrist", occupation_id: physician.id)
radiation_oncologist = Speciality.create(name: "Radiation Oncologist", occupation_id: physician.id)
respirologist = Speciality.create(name: "Respirologist", occupation_id: physician.id)
rheumatologist = Speciality.create(name: "Rheumatologist", occupation_id: physician.id)
anatomical = Speciality.create(name: "Anatomical Pathologist", occupation_id: physician.id)
general = Speciality.create(name: "General Pathologist", occupation_id: physician.id)
hematopathologist = Speciality.create(name: "Hematopathologist", occupation_id: physician.id)
biochemist = Speciality.create(name: "Medical Biochemist", occupation_id: physician.id)
microbiologist = Speciality.create(name: "Medical Microbiologist", occupation_id: physician.id)
neuropathologist = Speciality.create(name: "Neuropathologist", occupation_id: physician.id)
cardiac_surgeon = Speciality.create(name: "Cardiac Surgeon", occupation_id: physician.id)
general_surgeon = Speciality.create(name: "General Surgeon", occupation_id: physician.id)
neurosurgeon = Speciality.create(name: "Neurosurgeon", occupation_id: physician.id)
ophthalmologist = Speciality.create(name: "Ophthalmologist", occupation_id: physician.id)
orthopedic_surgeon = Speciality.create(name: "Orthopedic Surgeon", occupation_id: physician.id)
otorhinolaryngologist = Speciality.create(name: "Otorhinolaryngologist", occupation_id: physician.id)
pediatric_surgeon = Speciality.create(name: "Pediatric Surgeon", occupation_id: physician.id)
plastic_surgeon = Speciality.create(name: "Plastic Surgeon", occupation_id: physician.id)
thoracic_surgeon = Speciality.create(name: "Thoracic Surgeon", occupation_id: physician.id)
urologist = Speciality.create(name: "Urologist", occupation_id: physician.id)
vascular_surgeon = Speciality.create(name: "Vascular Surgeon", occupation_id: physician.id)
hospitalist = Speciality.create(name: "Hospitalist", occupation_id: physician.id)

cardiovascular_nursing = Speciality.create(name: "Cardiovascular Nursing", occupation_id: rn.id)
community_nursing = Speciality.create(name: "Community Health Nursing", occupation_id: rn.id)
critical_nursing = Speciality.create(name: "Critical Care Nursing", occupation_id: rn.id)
pediatric_nursing = Speciality.create(name: "Critical Care Pediatric Nursing", occupation_id: rn.id)
emergency_nursing = Speciality.create(name: "Emergency Nursing", occupation_id: rn.id)
enterostomal_nursing = Speciality.create(name: "Enterostomal Therapy Nursing", occupation_id: rn.id)
gastroenterology_nursing = Speciality.create(name: "Gastroenterology Nursing", occupation_id: rn.id)
gerontological_nursing = Speciality.create(name: "Gerontological Nursing", occupation_id: rn.id)
hospice_nursing = Speciality.create(name: "Hospice Palliative Care Nursing", occupation_id: rn.id)
surgical_nursing = Speciality.create(name: "Medical-Surgical Nursing", occupation_id: rn.id)
nephrology_nursing = Speciality.create(name: "Nephrology Nursing", occupation_id: rn.id)
neuroscience_nursing = Speciality.create(name: "Neuroscience Nursing", occupation_id: rn.id)
oh_nursing = Speciality.create(name: "Occupational Health Nursing", occupation_id: rn.id)
oncology_nursing = Speciality.create(name: "Oncology Nursing", occupation_id: rn.id)
orthopaedic_nursing = Speciality.create(name: "Orthopaedic Nursing", occupation_id: rn.id)
perianesthesia_nursing = Speciality.create(name: "PeriAnesthesia Nursing", occupation_id: rn.id)
perinatal_nursing = Speciality.create(name: "Perinatal Nursing", occupation_id: rn.id)
perioperative_nursing = Speciality.create(name: "Perioperative Nursing", occupation_id: rn.id)
psychiatric_nursing = Speciality.create(name: "Psychiatric and Mental Health Nursing", occupation_id: rn.id)
rehabilitation_nursing = Speciality.create(name: "Rehabilitation Nursing", occupation_id: rn.id)

primary_health_care = Speciality.create(name: "Primary Health Care", occupation_id: nursepractitioner.id)
adult = Speciality.create(name: "Adult", occupation_id: nursepractitioner.id)
pediatric = Speciality.create(name: "Pediatric Care", occupation_id: nursepractitioner.id)
anaesthesia = Speciality.create(name: "Anaesthesia", occupation_id: nursepractitioner.id)

puts "Creating care groups..."
# Create different care groups
east = CareGroup.create(name: "Anonymous", city: "Town", province: "ON")

# Create the users
puts "Creating users..."
# Patient users
useramritk = User.create(email: "Anonymous", password: "password")
# Clinician users
userclinician = User.create(email: "doctor@med.ca", password: "password")

puts "Creating clinicians..."
# Create the clinicians
clinician = Clinician.create(first_name: "Jane", last_name: "Doe", occupation_id: physician.id, speciality_id: gp.id, gender_id: female.id, office_number: "(905) XXX-XXXX", mobile_number: "(416) XXX-XXXX", emergency_message: "test", care_group_id: east.id, administrator: true, user_id: userclinician.id)

puts "Creating patients..."
# Create the patients
amrikg = Patient.create(clinician_id: clinician.id, first_name: "Amrit", last_name: "K", user_id: useramritk.id, diagnosis: "Pseudomyxoma Peritonei and Dementia", diagnosis_date: "2014-01-18 00:00:01 -0400", gender_id: male.id, birth_date: "1936-08-28 00:00:01 -0400", address: "Town, Ontario", phone_number: "XXX-XXX-XXXX", caregiver_name: "anonymous", other_symptom: nil, goals_of_care: "palliate", important_to_you: "details", shared_with: nil, care_group_id: east.id, patient_deceased: false, patient_archived: false)

puts "Creating assessment scores..."
# Create the scores for an ESAS assessment

puts "Creating comments..."

# Create the comments


puts "Creating notes..."

# Create the comments

# Create the notification settings
puts "Creating notification settings..."
#default = NotificationSetting.create(clinician_id: ericacarter.id, esas_yellow_highest_symptom: 6, esas_yellow_increase_of: 3, esas_yellow_email: 0, esas_yellow_text: 0, esas_orange_highest_symptom: 8, esas_orange_increase_of: 4, esas_orange_email: 1, esas_orange_text: 0, esas_red_highest_symptom: 10, esas_red_increase_of: 5, esas_red_email: 1, esas_red_text: 1, prfs_yellow: 3, prfs_yellow_email: 0, prfs_yellow_text: 0, prfs_orange: 4, prfs_orange_email: 1, prfs_orange_text: 0, prfs_red: 5, prfs_red_email: 1, prfs_red_text: 1)
#default = NotificationSetting.create(clinician_id: kathylee.id, esas_yellow_highest_symptom: 6, esas_yellow_increase_of: 3, esas_yellow_email: 0, esas_yellow_text: 0, esas_orange_highest_symptom: 8, esas_orange_increase_of: 4, esas_orange_email: 1, esas_orange_text: 0, esas_red_highest_symptom: 10, esas_red_increase_of: 5, esas_red_email: 1, esas_red_text: 1, prfs_yellow: 3, prfs_yellow_email: 0, prfs_yellow_text: 0, prfs_orange: 4, prfs_orange_email: 1, prfs_orange_text: 0, prfs_red: 5, prfs_red_email: 1, prfs_red_text: 1)

puts "There are now #{User.count} users, #{Clinician.count} clinicians, #{Patient.count} patients, #{Occupation.count} occupations, #{Speciality.count} specialities, #{Inputter.count} inputter types, #{Gender.count} genders, #{CareGroup.count} care groups, #{EsasAssessment.count} scores for an ESAS assessment, #{PrfsAssessment.count} scores for a PFRS assessment, #{Comment.count} comments between patients and clinicians, #{Note.count} care notes added to patients, #{NotificationSetting.count} notification settings added to clinicians, and #{OtherSymptom.count} other symptoms in the database."