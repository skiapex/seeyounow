# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Deletes everything from the database so that you start fresh
puts "Deleting all records from the database..."
Clinician.delete_all
Patient.delete_all
Gender.delete_all
Inputter.delete_all
EsasAssesment.delete_all
PrfsAssesment.delete_all
Comment.delete_all
Notification.delete_all
OtherSypmtom.delete_all
CareGroup.delete_all

puts "Creating gender types..."
# Create different possible genders
male = Gender.create(gender_type: "male")
female = Gender.create(gender_type: "female")
transgender = Gender.create(gender_type: "transgender")

puts "Creating additional symptom types..."
# Create different symptom types
constipation = OtherSypmtom.create(sypmtom_type: "constipation")
sweating = OtherSypmtom.create(sypmtom_type: "sweating")

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

puts "Creating care groups..."
# Create different care groups
brameast = CareGroup.create(name: "Brameast")
torcentral = CareGroup.create(name: "Toronto Central")

# Create the clinicians
puts "Creating clinicians..."
drmarshallsmith = Clinician.create(first_name: "Marshall", last_name: "Smith", occupation: "Doctor", gender: male.id, email: "mnsmith@medportal.ca", password: "password123", office_number: "(905) 792-2212", mobile_number: "(416) 232-5094", emergency_message: "INSTEAD OF CALLING 911
Your doctor and nurses would like you to call the Health Care team instead.
From 8am-8pm call your CCAC nurse at (866) 570-8505,
Amanda at 416-371-0733 or Dr. Smith' office at (905) 792-2212.
If this is after office hours have closed: from 8 pm to 8 am or on the weekend
please call the oncall Brameast physician at (416) 232-5094. Leave a message
and your phone number twice so that the oncall physician can call you back.
Please speak clearly. While waiting for the oncall physician or nurse to call you
back consider giving the patient Lorazepam 1mg under the tongue or another
dose of the breakthrough medication.", care_group_id: brameast.id)
joandixon = Clinician.create(first_name: "Joan", last_name: "Dixon", occupation: "Registered Nurse", gender: female.id, email: "ejdixon@medportal.ca", password: "y*tXa90e", office_number: "(905) 792-2212", mobile_number: "(416) 657-1145", emergency_message: "In an emergency, call Amanda at 416-371-0733 or Dr. Smith' office at (905) 792-2212", care_group_id: brameast.id)

# Create the patients
puts "Creating patients..."
johndoe = Patient.create(clinician_id: drmarshallsmith.id, first_name: "John", last_name: "Doe", username: "jdoe3", diagnosis: "Non-Hodgkin lymphoma", gender: male.id, age: "37", address: "12 Bramalea Rd, Brampton, ON", email: "johndoe@abc.com", password: "a3sh4", phone_number: "(905) 890-8108", caregiver_name: "Jane Doe", other_sypmtom: constipation.id, goals_of_care: "Quality of life and freedom from pain", shared_with: [drmarshallsmith.id, joandixon.id], patient_deceased: false, patient_archived: false)
cindypeters = Patient.create(clinician_id: joandixon.id, first_name: "Cindy", last_name: "Peters", username: "cpeters8", diagnosis: "Gastrointestinal cancer", gender: female.id, age: "83", address: "4652 Rosebank Cr, Orangeville, ON", email: "c.t.peters12@yahoo.com", password: "mrfluffy", phone_number: "(905) 489-4875", caregiver_name: "Marry Garcia", other_sypmtom: sweating.id, goals_of_care: "Quality of life and freedom from pain See the birth of my grandchild in February", shared_with: [drmarshallsmith.id, joandixon.id], patient_deceased: false, patient_archived: false)

puts "Creating assesment scores..."

# Create the scores for an ESAS assesment
EsasAssesment.create(patient_id: johndoe.id, clinician_id: drmarshallsmith.id, time: "12:03:32 2014-10-04", inputter_name: "Jane Doe", inputter_id: "partner.id", pain: 4, pain_comment: nil, tiredness: 6, tiredness_comment: nil, drowsiness: 6, drowsiness_comment: nil, nausea: 3, nausea_comment: nil, lack_of_appetite: 8, lack_of_appetite_comment: nil, shortness_of_breath: 2, shortness_of_breath_comment: nil, depression: 2, depression_comment: nil, wellbeing: 4, wellbeing_comment: nil, other_sypmtom_id: constipation.id, other_sypmtom_score: 9, other_sypmtom_comment: nil, esas_comment: "Constipation 9 took 3 laxitives and now 2 hours later feeling good result")
EsasAssesment.create(patient_id: cindypeters.id, clinician_id: joandixon.id, time: "12:08:56 2014-10-04", inputter_name: "Paul Ku", inputter_id: "care_aid.id", pain: 7, pain_comment: nil, tiredness: 5, tiredness_comment: nil, drowsiness: 6, drowsiness_comment: nil, nausea: 8, nausea_comment: nil, lack_of_appetite: 7, lack_of_appetite_comment: nil, shortness_of_breath: 4, shortness_of_breath_comment: nil, depression: 5, depression_comment: nil, wellbeing: 6, wellbeing_comment: nil, other_sypmtom_id: sweating.id, other_sypmtom_score: 4, other_sypmtom_comment: "Still leading to dehydration", esas_comment: nil)

# Create the scores for an PFRS assesment
PrfsAssesment.create(patient_id: johndoe.id, clinician_id: drmarshallsmith.id, time: "17:46 2014-10-05", inputter_name: "Jane Doe", inputter_id: "partner.id", activity_and_function: 2, prfs_comment: nil)
PrfsAssesment.create(patient_id: cindypeters.id, clinician_id: joandixon.id, time: "17:53 2014-10-05", inputter_name: "Paul Ku", inputter_id: "care_aid.id", activity_and_function: 3, prfs_comment: nil)

# Create the comments
Comment.create(patient_id: johndoe.id, clinician_id: drmarshallsmith.id, from: drmarshallsmith.id, time: "13:26 2014-10-05", general_comment: "Good. Please comment in the morning on how you feel")
Comment.create(patient_id: johndoe.id, clinician_id: drmarshallsmith.id, from: johndoe.id, time: "14:39 2014-10-05", general_comment: "Feeling good this morning. Thanks")

# Create the notification settings
default = Notification.create(clinician_id: drmarshallsmith.id, esas_yellow_highest_symptom: 6, esas_yellow_increase_of: 3, esas_yellow_email: 0, esas_yellow_text: 0, esas_orange_highest_symptom: 8, esas_orange_increase_of: 4, esas_orange_email: 1, esas_orange_text: 0, esas_red_highest_symptom: 10, esas_red_increase_of: 5, esas_red_email: 1, esas_red_text: 1, prfs_yellow: 3, prfs_yellow_email: 0, prfs_yellow_text: 0, prfs_orange: 4, prfs_orange_email: 1, prfs_orange_text: 0, prfs_red: 5, prfs_red_email: 1, prfs_red_text: 1)

puts "There are now #{Clinician.count} clinicians, #{Patient.count} patients, #{EsasAssesment.count} scores for an ESAS assesment, #{PrfsAssesment.count} scores for a PFRS assesment, #{Comment.count} comments between patients and clinicians, and #{OtherSypmtom.count} other symptoms in the database."