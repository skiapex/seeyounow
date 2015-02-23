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
OtherSymptom.delete_all
CareGroup.delete_all
Occupation.delete_all

puts "Creating gender types..."
# Create different possible genders
male = Gender.create(gender_type: "male")
female = Gender.create(gender_type: "female")
transgender = Gender.create(gender_type: "transgender")

puts "Creating additional symptom types..."
# Create different symptom types
constipation = OtherSymptom.create(symptom_type: "constipation")
sweating = OtherSymptom.create(symptom_type: "sweating")
urine = OtherSymptom.create(symptom_type: "discoloured urine")

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
# Create different occupations
doctor = Occupation.create(name: "Doctor")
rn = Occupation.create(name: "Registered Nurse")
nursepractitioner = Occupation.create(name: "Nurse Practitioner")
nursemanager = Occupation.create(name: "Nurse Manager")
oncologist = Occupation.create(name: "Oncologist")

puts "Creating occupations..."
# Create different care groups
brameast = CareGroup.create(name: "Brameast")
torcentral = CareGroup.create(name: "Toronto Central")

# Create the clinicians
puts "Creating clinicians..."
drmarshallsmith = Clinician.create(first_name: "Marshall", last_name: "Smith", occupation_id: doctor.id, gender_id: male.id, email: "mnsmith@medportal.ca", password: "password123", office_number: "(905) 792-2212", mobile_number: "(416) 232-5094", emergency_message: "INSTEAD OF CALLING 911
Your doctor and nurses would like you to call the Health Care team instead.
From 8am-8pm call your CCAC nurse at (866) 570-8505,
Joan at 416-371-0733 or Dr. Smith' office at (905) 792-2212.
If this is after office hours have closed: from 8 pm to 8 am or on the weekend
please call the oncall Brameast physician at (416) 232-5094. Leave a message
and your phone number twice so that the oncall physician can call you back.
Please speak clearly.", care_group_id: brameast.id)
joandixon = Clinician.create(first_name: "Joan", last_name: "Dixon", occupation_id: rn.id, gender_id: female.id, email: "ejdixon@medportal.ca", password: "y*tXa90e", office_number: "(905) 792-2212", mobile_number: "(416) 657-1145", emergency_message: "In an emergency, call Joan at 416-371-0733 or Dr. Smith' office at (905) 792-2212", care_group_id: brameast.id)
rachellmiddleton = Clinician.create(first_name: "Rachell", last_name: "Middleton", occupation_id: nursepractitioner.id, gender_id: female.id, email: "rldmiddleton@medportal.ca", password: "&(kjhl450", office_number: "(905) 563-2561", mobile_number: "(416) 563-7258", emergency_message: "In an emergency, call Rachell at 416-371-0733 or Dr. Smith' office at (905) 792-2212", care_group_id: brameast.id)
macariogarcia = Clinician.create(first_name: "Macario", last_name: "Garcia", occupation_id: nursemanager.id, gender_id: male.id, email: "macariogarcia@medportal.ca", password: "*0hk#$jbk", office_number: "(905) 654-3647", mobile_number: "(416) 978-8777", emergency_message: "In an emergency, call Joan at 416-371-0733 or Dr. Smith' office at (905) 792-2212", care_group_id: brameast.id)
debralin = Clinician.create(first_name: "Debra", last_name: "Lin", occupation_id: oncologist.id, gender_id: female.id, email: "debralin@medportal.ca", password: "*0hk#$jbk", office_number: "(905) 654-3647", mobile_number: "(416) 978-8777", emergency_message: "In an emergency, call Joan at 416-371-0733 or Dr. Lin' office at (905) 792-2212", care_group_id: torcentral.id)


# Create the patients
puts "Creating patients..."
johndoe = Patient.create(clinician_id: drmarshallsmith.id, first_name: "John", last_name: "Doe", username: "jdoe3", diagnosis: "Non-Hodgkin lymphoma", gender_id: male.id, age: "37", address: "12 Bramalea Rd, Brampton, ON", email: "johndoe@abc.com", password: "a3sh4", phone_number: "(905) 890-8108", caregiver_name: "Jane Doe", other_symptom: constipation.id, goals_of_care: "Quality of life and freedom from pain", shared_with: [drmarshallsmith.id, joandixon.id], patient_deceased: false, patient_archived: false)
cindypeters = Patient.create(clinician_id: joandixon.id, first_name: "Cindy", last_name: "Peters", username: "cpeters8", diagnosis: "Gastrointestinal cancer", gender_id: female.id, age: "83", address: "4652 Rosebank Cr, Orangeville, ON", email: "c.t.peters12@yahoo.com", password: "mrfluffy", phone_number: "(905) 489-4875", caregiver_name: "Sue Jeenes", other_symptom: sweating.id, goals_of_care: "Quality of life and freedom from pain See the birth of my grandchild in February", shared_with: [drmarshallsmith.id, joandixon.id], patient_deceased: false, patient_archived: false)
yiwang = Patient.create(clinician_id: rachellmiddleton.id, first_name: "Yi", last_name: "Wang", username: "ywang23", diagnosis: "Congestive heart failure", gender_id: male.id, age: "62", address: "16 Madoc Dr, Brampton, ON", email: "yi_wang@deloitte.com", password: "39yiwang22", phone_number: "(905) 489-9446", caregiver_name: "Tania Abbot", other_symptom: sweating.id, goals_of_care: "Maintenance of function", shared_with: [drmarshallsmith.id, rachellmiddleton.id], patient_deceased: false, patient_archived: false)
apwinderbrar = Patient.create(clinician_id: macariogarcia.id, first_name: "Apwinder", last_name: "Brar", username: "abrar3", diagnosis: "Kidney failure", gender_id: male.id, age: "38", address: "3 Rainstorm Rd, Brampton, ON", email: "apwinderb@gmail.com", password: "AB76cats", phone_number: "(905) 234-9409", caregiver_name: "Saranjit Brar", other_symptom: urine.id, goals_of_care: "A good death and relief of suffering", shared_with: [joandixon.id, rachellmiddleton.id], patient_deceased: false, patient_archived: false)

puts "Creating assesment scores..."

# Create the scores for an ESAS assesment
EsasAssesment.create(patient_id: johndoe.id, clinician_id: drmarshallsmith.id, time: "2014-10-04 12:17:37 -0600", inputter_name: "Jane Doe", inputter_id: partner.id, pain: 4, pain_comment: nil, tiredness: 6, tiredness_comment: nil, drowsiness: 6, drowsiness_comment: nil, nausea: 3, nausea_comment: nil, lack_of_appetite: 8, lack_of_appetite_comment: nil, shortness_of_breath: 2, shortness_of_breath_comment: nil, depression: 2, depression_comment: nil, wellbeing: 4, wellbeing_comment: nil, other_symptom_id: constipation.id, other_symptom_score: 9, other_symptom_comment: nil, esas_comment: "Constipation 9 took 3 laxitives and now 2 hours later feeling good result")
EsasAssesment.create(patient_id: johndoe.id, clinician_id: drmarshallsmith.id, time: "2014-10-05 13:53:21 -0600", inputter_name: "Jane Doe", inputter_id: partner.id, pain: 5, pain_comment: "little worse", tiredness: 5, tiredness_comment: nil, drowsiness: 5, drowsiness_comment: nil, nausea: 4, nausea_comment: nil, lack_of_appetite: 8, lack_of_appetite_comment: nil, shortness_of_breath: 4, shortness_of_breath_comment: nil, depression: 3, depression_comment: nil, wellbeing: 5, wellbeing_comment: nil, other_symptom_id: constipation.id, other_symptom_score: 6, other_symptom_comment: nil, esas_comment: "More pain today, meds not strong enough")
EsasAssesment.create(patient_id: johndoe.id, clinician_id: drmarshallsmith.id, time: "2014-10-06 12:45:45 -0600", inputter_name: "Jane Doe", inputter_id: partner.id, pain: 4, pain_comment: nil, tiredness: 5, tiredness_comment: nil, drowsiness: 7, drowsiness_comment: nil, nausea: 3, nausea_comment: nil, lack_of_appetite: 7, lack_of_appetite_comment: nil, shortness_of_breath: 3, shortness_of_breath_comment: nil, depression: 3, depression_comment: nil, wellbeing: 4, wellbeing_comment: nil, other_symptom_id: constipation.id, other_symptom_score: 7, other_symptom_comment: nil, esas_comment: nil)

EsasAssesment.create(patient_id: cindypeters.id, clinician_id: joandixon.id, time: "2014-10-04 12:08:56 -0600", inputter_name: "Paul Ku", inputter_id: care_aid.id, pain: 7, pain_comment: nil, tiredness: 5, tiredness_comment: nil, drowsiness: 6, drowsiness_comment: nil, nausea: 8, nausea_comment: nil, lack_of_appetite: 7, lack_of_appetite_comment: nil, shortness_of_breath: 4, shortness_of_breath_comment: nil, depression: 5, depression_comment: nil, wellbeing: 6, wellbeing_comment: nil, other_symptom_id: sweating.id, other_symptom_score: 4, other_symptom_comment: "Still leading to dehydration", esas_comment: nil)
EsasAssesment.create(patient_id: cindypeters.id, clinician_id: joandixon.id, time: "2014-10-06 15:43:21 -0600", inputter_name: "Paul Ku", inputter_id: care_aid.id, pain: 8, pain_comment: nil, tiredness: 6, tiredness_comment: nil, drowsiness: 5, drowsiness_comment: nil, nausea: 7, nausea_comment: nil, lack_of_appetite: 8, lack_of_appetite_comment: nil, shortness_of_breath: 5, shortness_of_breath_comment: nil, depression: 5, depression_comment: nil, wellbeing: 7, wellbeing_comment: nil, other_symptom_id: sweating.id, other_symptom_score: 6, other_symptom_comment: "Still leading to dehydration", esas_comment: "She hasn't eaten anything all day and is barely drinking enough to replace the fluids lost from sweating")
EsasAssesment.create(patient_id: cindypeters.id, clinician_id: drmarshallsmith.id, time: "2014-10-08 10:02:34 -0600", inputter_name: "Paul Ku", inputter_id: care_aid.id, pain: 9, pain_comment: nil, tiredness: 5, tiredness_comment: nil, drowsiness: 7, drowsiness_comment: nil, nausea: 8, nausea_comment: nil, lack_of_appetite: 9, lack_of_appetite_comment: nil, shortness_of_breath: 5, shortness_of_breath_comment: nil, depression: 5, depression_comment: nil, wellbeing: 7, wellbeing_comment: nil, other_symptom_id: sweating.id, other_symptom_score: 3, other_symptom_comment: "Still leading to dehydration", esas_comment: nil)

EsasAssesment.create(patient_id: yiwang.id, clinician_id: rachellmiddleton.id, time: "2014-10-04 11:03:32 -0600", inputter_name: "Tania Abbot", inputter_id: care_aid.id, pain: 4, pain_comment: nil, tiredness: 6, tiredness_comment: nil, drowsiness: 6, drowsiness_comment: nil, nausea: 3, nausea_comment: nil, lack_of_appetite: 8, lack_of_appetite_comment: nil, shortness_of_breath: 2, shortness_of_breath_comment: nil, depression: 2, depression_comment: nil, wellbeing: 4, wellbeing_comment: nil, other_symptom_id: sweating.id, other_symptom_score: 9, other_symptom_comment: nil, esas_comment: nil)
EsasAssesment.create(patient_id: yiwang.id, clinician_id: rachellmiddleton.id, time: "2014-10-05 13:53:21 -0600", inputter_name: "Tania Abbot", inputter_id: care_aid.id, pain: 5, pain_comment: "little worse", tiredness: 5, tiredness_comment: nil, drowsiness: 5, drowsiness_comment: nil, nausea: 4, nausea_comment: nil, lack_of_appetite: 8, lack_of_appetite_comment: nil, shortness_of_breath: 4, shortness_of_breath_comment: nil, depression: 3, depression_comment: nil, wellbeing: 5, wellbeing_comment: nil, other_symptom_id: sweating.id, other_symptom_score: 6, other_symptom_comment: nil, esas_comment: "He is complaining about chest pains")
EsasAssesment.create(patient_id: yiwang.id, clinician_id: macariogarcia.id, time: "2014-10-06 15:43:21 -0600", inputter_name: "Louis Wang", inputter_id: son.id, pain: 4, pain_comment: nil, tiredness: 5, tiredness_comment: nil, drowsiness: 7, drowsiness_comment: nil, nausea: 3, nausea_comment: nil, lack_of_appetite: 7, lack_of_appetite_comment: nil, shortness_of_breath: 3, shortness_of_breath_comment: nil, depression: 3, depression_comment: nil, wellbeing: 4, wellbeing_comment: nil, other_symptom_id: sweating.id, other_symptom_score: 7, other_symptom_comment: nil, esas_comment: nil)

EsasAssesment.create(patient_id: apwinderbrar.id, clinician_id: rachellmiddleton.id, time: "2014-10-04 09:08:56 -0600", inputter_name: "Saranjit Brar", inputter_id: partner.id, pain: 7, pain_comment: nil, tiredness: 5, tiredness_comment: nil, drowsiness: 6, drowsiness_comment: nil, nausea: 8, nausea_comment: nil, lack_of_appetite: 7, lack_of_appetite_comment: nil, shortness_of_breath: 4, shortness_of_breath_comment: nil, depression: 5, depression_comment: nil, wellbeing: 6, wellbeing_comment: nil, other_symptom_id: urine.id, other_symptom_score: 4, other_symptom_comment: "Blood in urine", esas_comment: nil)
EsasAssesment.create(patient_id: apwinderbrar.id, clinician_id: debralin.id, time: "2014-10-06 08:43:21 -0600", inputter_name: "Saranjit Brar", inputter_id: partner.id, pain: 8, pain_comment: nil, tiredness: 6, tiredness_comment: nil, drowsiness: 5, drowsiness_comment: nil, nausea: 7, nausea_comment: nil, lack_of_appetite: 8, lack_of_appetite_comment: nil, shortness_of_breath: 5, shortness_of_breath_comment: nil, depression: 5, depression_comment: nil, wellbeing: 7, wellbeing_comment: nil, other_symptom_id: urine.id, other_symptom_score: 6, other_symptom_comment: "Brown in urine", esas_comment: "He is worried that he is feeling worse today")
EsasAssesment.create(patient_id: apwinderbrar.id, clinician_id: macariogarcia.id, time: "2014-10-08 09:02:34 -0600", inputter_name: "Saranjit Brar", inputter_id: partner.id, pain: 9, pain_comment: nil, tiredness: 5, tiredness_comment: nil, drowsiness: 7, drowsiness_comment: nil, nausea: 8, nausea_comment: nil, lack_of_appetite: 9, lack_of_appetite_comment: nil, shortness_of_breath: 5, shortness_of_breath_comment: nil, depression: 5, depression_comment: nil, wellbeing: 7, wellbeing_comment: nil, other_symptom_id: urine.id, other_symptom_score: 3, other_symptom_comment: "Slightly better today", esas_comment: nil)

# Create the scores for an PFRS assesment
PrfsAssesment.create(patient_id: johndoe.id, clinician_id: drmarshallsmith.id, time: "2014-10-05 17:46:32 -0600", inputter_name: "Jane Doe", inputter_id: partner.id, activity_and_function: 2, prfs_comment: nil)
PrfsAssesment.create(patient_id: cindypeters.id, clinician_id: joandixon.id, time: "2014-10-05 17:53:21 -0600", inputter_name: "Paul Ku", inputter_id: care_aid.id, activity_and_function: 3, prfs_comment: nil)

# Create the comments
Comment.create(patient_id: johndoe.id, clinician_id: drmarshallsmith.id, from: drmarshallsmith.id, time: "2014-10-05 13:26:32 -0600", general_comment: "Good. Please comment in the morning on how you feel")
Comment.create(patient_id: johndoe.id, clinician_id: drmarshallsmith.id, from: johndoe.id, time: "2014-10-05 14:39:01 -0600", general_comment: "Feeling good this morning. Thanks")

Comment.create(patient_id: apwinderbrar.id, clinician_id: macariogarcia.id, from: macariogarcia.id, time: "2014-10-04 09:08:56 -0600", general_comment: "Let me know if it's still bad tomorrow and we can schedule something from there")
Comment.create(patient_id: apwinderbrar.id, clinician_id: macariogarcia.id, from: apwinderbrar.id, time: "2014-10-06 08:43:21 -0600", general_comment: "Seems like it was just a bad day")

# Create the notification settings
default = Notification.create(clinician_id: drmarshallsmith.id, esas_yellow_highest_symptom: 6, esas_yellow_increase_of: 3, esas_yellow_email: 0, esas_yellow_text: 0, esas_orange_highest_symptom: 8, esas_orange_increase_of: 4, esas_orange_email: 1, esas_orange_text: 0, esas_red_highest_symptom: 10, esas_red_increase_of: 5, esas_red_email: 1, esas_red_text: 1, prfs_yellow: 3, prfs_yellow_email: 0, prfs_yellow_text: 0, prfs_orange: 4, prfs_orange_email: 1, prfs_orange_text: 0, prfs_red: 5, prfs_red_email: 1, prfs_red_text: 1)

puts "There are now #{Clinician.count} clinicians, #{Patient.count} patients, #{Occupation.count} occupations, #{Inputter.count} inputter types, #{Gender.count} genders, #{CareGroup.count} care groups, #{EsasAssesment.count} scores for an ESAS assesment, #{PrfsAssesment.count} scores for a PFRS assesment, #{Comment.count} comments between patients and clinicians, and #{OtherSymptom.count} other symptoms in the database."