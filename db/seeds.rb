# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Deletes everything from the database so that you start fresh
puts "Deleting all records from the database..."
User.delete_all
Clinician.delete_all
Patient.delete_all
Gender.delete_all
Inputter.delete_all
EsasAssessment.delete_all
PrfsAssessment.delete_all
Comment.delete_all
NotificationSetting.delete_all
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

# Create the users
# Patient users
puts "Creating users..."
userjohndoe = User.create(email: "johndoe@abc.com", password: "a3sh4")
usercindypeters = User.create(email: "c.t.peters12@yahoo.com", password: "mrfluffy")
useryiwang = User.create(email: "yi_wang@deloitte.com", password: "39yiwang22")
userapwinderbrar = User.create(email: "apwinderb@gmail.com", password: "AB76cats")
userdilmarousseff = User.create(email: "dilma_rousseff@brazil.com", password: "39dilmarousseff22")
userbenjaminlosseau = User.create(email: "benjamin_losseau@gmail.com", password: "AB76dogs")
usergcobisamaqanda = User.create(email: "gcobisa_maqanda@hotmail.com", password: "39gcobisamaqanda22")
usercoreynichols = User.create(email: "corey_nichols@gmail.com", password: "AB76rats")
usertrentterris = User.create(email: "trent_terris@hotmail.com", password: "39trentterris22")
userhannajansson = User.create(email: "hanna_jansson@gmail.com", password: "AB76birds")

# Clinician users
userdrmarshallsmith = User.create(email: "mnsmith@medportal.ca", password: "password123")
userjoandixon = User.create(email: "ejdixon@medportal.ca", password: "y*tXa90e")
userrachellmiddleton = User.create(email: "rldmiddleton@medportal.ca", password: "&(kjhl450")
usermacariogarcia = User.create(email: "macariogarcia@medportal.ca", password: "*0hk#$jbk")
userdebralin = User.create(email: "debralin@medportal.ca", password: "*0hk#$jbk")

# Create the clinicians
puts "Creating clinicians..."
drmarshallsmith = Clinician.create(first_name: "Marshall", last_name: "Smith", occupation_id: doctor.id, gender_id: male.id, office_number: "(905) 792-2212", mobile_number: "(416) 232-5094", emergency_message: "INSTEAD OF CALLING 911
Your doctor and nurses would like you to call the Health Care team instead.
From 8am-8pm call your CCAC nurse at (866) 570-8505,
Joan at 416-371-0733 or Dr. Smith' office at (905) 792-2212.
If this is after office hours have closed: from 8 pm to 8 am or on the weekend
please call the oncall Brameast physician at (416) 232-5094. Leave a message
and your phone number twice so that the oncall physician can call you back.
Please speak clearly.", care_group_id: brameast.id, user_id: userdrmarshallsmith.id)
joandixon = Clinician.create(first_name: "Joan", last_name: "Dixon", occupation_id: rn.id, gender_id: female.id, office_number: "(905) 792-2212", mobile_number: "(416) 657-1145", emergency_message: "In an emergency, call Joan at 416-371-0733 or Dr. Smith' office at (905) 792-2212", care_group_id: brameast.id, user_id: userjoandixon.id)
rachellmiddleton = Clinician.create(first_name: "Rachell", last_name: "Middleton", occupation_id: nursepractitioner.id, gender_id: female.id, office_number: "(905) 563-2561", mobile_number: "(416) 563-7258", emergency_message: "In an emergency, call Rachell at 416-371-0733 or Dr. Smith' office at (905) 792-2212", care_group_id: brameast.id, user_id: userrachellmiddleton.id)
macariogarcia = Clinician.create(first_name: "Macario", last_name: "Garcia", occupation_id: nursemanager.id, gender_id: male.id, office_number: "(905) 654-3647", mobile_number: "(416) 978-8777", emergency_message: "In an emergency, call Joan at 416-371-0733 or Dr. Smith' office at (905) 792-2212", care_group_id: brameast.id, user_id: usermacariogarcia.id)
debralin = Clinician.create(first_name: "Debra", last_name: "Lin", occupation_id: oncologist.id, gender_id: female.id, office_number: "(905) 654-3647", mobile_number: "(416) 978-8777", emergency_message: "In an emergency, call Joan at 416-371-0733 or Dr. Lin' office at (905) 792-2212", care_group_id: torcentral.id, user_id: userdebralin.id)


# Create the patients
puts "Creating patients..."
johndoe = Patient.create(clinician_id: drmarshallsmith.id, first_name: "John", last_name: "Doe", user_id: userjohndoe.id, diagnosis: "Non-Hodgkin lymphoma", gender_id: male.id, age: "37", address: "12 Bramalea Rd, Brampton, ON", phone_number: "(905) 890-8108", caregiver_name: "Jane Doe", other_symptom: constipation.id, goals_of_care: "Quality of life and freedom from pain", shared_with: [drmarshallsmith.id, joandixon.id], patient_deceased: false, patient_archived: false)
cindypeters = Patient.create(clinician_id: joandixon.id, first_name: "Cindy", last_name: "Peters", user_id: usercindypeters.id, diagnosis: "Gastrointestinal cancer", gender_id: female.id, age: "83", address: "4652 Rosebank Cr, Orangeville, ON", phone_number: "(905) 489-4875", caregiver_name: "Sue Jeenes", other_symptom: sweating.id, goals_of_care: "Quality of life and freedom from pain See the birth of my grandchild in February", shared_with: [drmarshallsmith.id, joandixon.id], patient_deceased: false, patient_archived: false)
yiwang = Patient.create(clinician_id: rachellmiddleton.id, first_name: "Yi", last_name: "Wang", user_id: useryiwang.id, diagnosis: "Congestive heart failure", gender_id: male.id, age: "62", address: "16 Madoc Dr, Brampton, ON", phone_number: "(905) 489-9446", caregiver_name: "Tania Abbot", other_symptom: sweating.id, goals_of_care: "Maintenance of function", shared_with: [drmarshallsmith.id, rachellmiddleton.id], patient_deceased: false, patient_archived: false)
apwinderbrar = Patient.create(clinician_id: macariogarcia.id, first_name: "Apwinder", last_name: "Brar", user_id: userapwinderbrar.id, diagnosis: "Kidney failure", gender_id: male.id, age: "38", address: "3 Rainstorm Rd, Brampton, ON", phone_number: "(905) 234-9409", caregiver_name: "Saranjit Brar", other_symptom: urine.id, goals_of_care: "A good death and relief of suffering", shared_with: [joandixon.id, rachellmiddleton.id], patient_deceased: false, patient_archived: false)
dilmarousseff = Patient.create(clinician_id: drmarshallsmith.id, first_name: "Dilmar", last_name: "Rousseff", user_id: userdilmarousseff.id, diagnosis: "Chronic lower respiratory disease", gender_id: female.id, age: "50", address: "16 Madoc Dr, Brampton, ON", phone_number: "(905) 489-9446", caregiver_name: "Tania Abbot", other_symptom: sweating.id, goals_of_care: "Maintenance of function", shared_with: [joandixon.id, rachellmiddleton.id], patient_deceased: false, patient_archived: false)
benjaminlosseau = Patient.create(clinician_id: drmarshallsmith.id, first_name: "Benjamin", last_name: "Llosseau", user_id: userbenjaminlosseau.id, diagnosis: "Diabetes", gender_id: male.id, age: "78", address: "3 Rainstorm Rd, Brampton, ON", phone_number: "(905) 234-9409", caregiver_name: "Saranjit Brar", other_symptom: constipation.id, goals_of_care: "A good death and relief of suffering", shared_with: [joandixon.id, rachellmiddleton.id], patient_deceased: false, patient_archived: false)
gcobisamaqanda = Patient.create(clinician_id: drmarshallsmith.id, first_name: "Gcobisa", last_name: "Maqanda", user_id: usergcobisamaqanda.id, diagnosis: "Nephrotic syndrome", gender_id: female.id, age: "50", address: "16 Madoc Dr, Brampton, ON", phone_number: "(905) 489-9446", caregiver_name: "Tania Abbot", other_symptom: sweating.id, goals_of_care: "Maintenance of function", shared_with: [joandixon.id, rachellmiddleton.id], patient_deceased: false, patient_archived: false)
coreynichols = Patient.create(clinician_id: drmarshallsmith.id, first_name: "Corey", last_name: "Nicols", user_id: usercoreynichols.id, diagnosis: "Congestive heart failure", gender_id: male.id, age: "83", address: "3 Rainstorm Rd, Brampton, ON", phone_number: "(905) 234-9409", caregiver_name: "Saranjit Brar", other_symptom: sweating.id, goals_of_care: "A good death and relief of suffering", shared_with: [joandixon.id, rachellmiddleton.id], patient_deceased: false, patient_archived: false)
trentterris = Patient.create(clinician_id: drmarshallsmith.id, first_name: "Trent", last_name: "Terris", user_id: usertrentterris.id, diagnosis: "Advanced liver disease", gender_id: male.id, age: "90", address: "16 Madoc Dr, Brampton, ON", phone_number: "(905) 489-9446", caregiver_name: "Tania Abbot", other_symptom: sweating.id, goals_of_care: "Maintenance of function", shared_with: [joandixon.id, rachellmiddleton.id], patient_deceased: true, patient_archived: true)
hannajansson = Patient.create(clinician_id: drmarshallsmith.id, first_name: "Hanna", last_name: "Jansson", user_id: userhannajansson.id, diagnosis: "Parkinson's disease", gender_id: female.id, age: "52", address: "3 Rainstorm Rd, Brampton, ON", phone_number: "(905) 234-9409", caregiver_name: "Saranjit Brar", other_symptom: sweating.id, goals_of_care: "A good death and relief of suffering", shared_with: [joandixon.id, rachellmiddleton.id], patient_deceased: false, patient_archived: false)

puts "Creating assessment scores..."

# Create the scores for an ESAS assessment
EsasAssessment.create(patient_id: johndoe.id, clinician_id: drmarshallsmith.id, created_at: "2015-04-04 11:03:32 -0600", inputter_name: "Jane Doe", inputter_id: partner.id, pain: 4, pain_comment: nil, tiredness: 6, tiredness_comment: nil, drowsiness: 6, drowsiness_comment: nil, nausea: 3, nausea_comment: nil, lack_of_appetite: 8, lack_of_appetite_comment: nil, shortness_of_breath: 2, shortness_of_breath_comment: nil, depression: 2, depression_comment: nil, wellbeing: 4, wellbeing_comment: nil, other_symptom_id: constipation.id, other_symptom_score: 9, other_symptom_comment: nil, esas_comment: "Constipation 9 took 3 laxitives and now 2 hours later feeling good result")
EsasAssessment.create(patient_id: johndoe.id, clinician_id: drmarshallsmith.id, created_at: "2015-04-05 13:53:21 -0600", inputter_name: "Jane Doe", inputter_id: partner.id, pain: 5, pain_comment: "little worse", tiredness: 5, tiredness_comment: nil, drowsiness: 5, drowsiness_comment: nil, nausea: 4, nausea_comment: nil, lack_of_appetite: 8, lack_of_appetite_comment: nil, shortness_of_breath: 4, shortness_of_breath_comment: nil, depression: 3, depression_comment: nil, wellbeing: 5, wellbeing_comment: nil, other_symptom_id: constipation.id, other_symptom_score: 6, other_symptom_comment: nil, esas_comment: "More pain today, meds not strong enough")
EsasAssessment.create(patient_id: johndoe.id, clinician_id: drmarshallsmith.id, created_at: "2015-04-06 15:43:21 -0600", inputter_name: "Jane Doe", inputter_id: partner.id, pain: 4, pain_comment: nil, tiredness: 5, tiredness_comment: nil, drowsiness: 7, drowsiness_comment: nil, nausea: 3, nausea_comment: nil, lack_of_appetite: 7, lack_of_appetite_comment: nil, shortness_of_breath: 3, shortness_of_breath_comment: nil, depression: 3, depression_comment: nil, wellbeing: 4, wellbeing_comment: nil, other_symptom_id: constipation.id, other_symptom_score: 7, other_symptom_comment: nil, esas_comment: nil)
EsasAssessment.create(patient_id: johndoe.id, clinician_id: drmarshallsmith.id, created_at: "2015-04-07 09:08:56 -0600", inputter_name: "Jane Doe", inputter_id: partner.id, pain: 4, pain_comment: nil, tiredness: 7, tiredness_comment: nil, drowsiness: 3, drowsiness_comment: nil, nausea: 5, nausea_comment: nil, lack_of_appetite: 6, lack_of_appetite_comment: nil, shortness_of_breath: 4, shortness_of_breath_comment: nil, depression: 5, depression_comment: nil, wellbeing: 6, wellbeing_comment: nil, other_symptom_id: constipation.id, other_symptom_score: 9, other_symptom_comment: nil, esas_comment: "Constipation 9 took 3 laxitives and now 2 hours later feeling good result")
EsasAssessment.create(patient_id: johndoe.id, clinician_id: drmarshallsmith.id, created_at: "2015-04-08 04:04:34 -0600", inputter_name: "Jane Doe", inputter_id: partner.id, pain: 5, pain_comment: "little worse", tiredness: 7, tiredness_comment: nil, drowsiness: 5, drowsiness_comment: nil, nausea: 6, nausea_comment: nil, lack_of_appetite: 7, lack_of_appetite_comment: nil, shortness_of_breath: 4, shortness_of_breath_comment: nil, depression: 3, depression_comment: nil, wellbeing: 5, wellbeing_comment: nil, other_symptom_id: constipation.id, other_symptom_score: 6, other_symptom_comment: nil, esas_comment: "More pain today, meds not strong enough")
EsasAssessment.create(patient_id: johndoe.id, clinician_id: drmarshallsmith.id, created_at: "2015-04-09 08:43:21 -0600", inputter_name: "Jane Doe", inputter_id: partner.id, pain: 4, pain_comment: nil, tiredness: 5, tiredness_comment: nil, drowsiness: 6, drowsiness_comment: nil, nausea: 8, nausea_comment: nil, lack_of_appetite: 5, lack_of_appetite_comment: nil, shortness_of_breath: 5, shortness_of_breath_comment: nil, depression: 4, depression_comment: nil, wellbeing: 6, wellbeing_comment: nil, other_symptom_id: constipation.id, other_symptom_score: 5, other_symptom_comment: nil, esas_comment: nil)

EsasAssessment.create(patient_id: cindypeters.id, clinician_id: joandixon.id, created_at: "2015-04-04 12:08:56 -0600", inputter_name: "Paul Ku", inputter_id: care_aid.id, pain: 7, pain_comment: nil, tiredness: 5, tiredness_comment: nil, drowsiness: 6, drowsiness_comment: nil, nausea: 8, nausea_comment: nil, lack_of_appetite: 7, lack_of_appetite_comment: nil, shortness_of_breath: 4, shortness_of_breath_comment: nil, depression: 5, depression_comment: nil, wellbeing: 6, wellbeing_comment: nil, other_symptom_id: sweating.id, other_symptom_score: 4, other_symptom_comment: "Still leading to dehydration", esas_comment: nil)
EsasAssessment.create(patient_id: cindypeters.id, clinician_id: joandixon.id, created_at: "2015-04-06 15:43:21 -0600", inputter_name: "Paul Ku", inputter_id: care_aid.id, pain: 8, pain_comment: nil, tiredness: 6, tiredness_comment: nil, drowsiness: 5, drowsiness_comment: nil, nausea: 7, nausea_comment: nil, lack_of_appetite: 8, lack_of_appetite_comment: nil, shortness_of_breath: 5, shortness_of_breath_comment: nil, depression: 5, depression_comment: nil, wellbeing: 7, wellbeing_comment: nil, other_symptom_id: sweating.id, other_symptom_score: 6, other_symptom_comment: "Still leading to dehydration", esas_comment: "She hasn't eaten anything all day and is barely drinking enough to replace the fluids lost from sweating")
EsasAssessment.create(patient_id: cindypeters.id, clinician_id: drmarshallsmith.id, created_at: "2015-04-08 04:04:34 -0600", inputter_name: "Paul Ku", inputter_id: care_aid.id, pain: 9, pain_comment: nil, tiredness: 5, tiredness_comment: nil, drowsiness: 7, drowsiness_comment: nil, nausea: 8, nausea_comment: nil, lack_of_appetite: 9, lack_of_appetite_comment: nil, shortness_of_breath: 5, shortness_of_breath_comment: nil, depression: 5, depression_comment: nil, wellbeing: 7, wellbeing_comment: nil, other_symptom_id: sweating.id, other_symptom_score: 3, other_symptom_comment: "Still leading to dehydration", esas_comment: nil)

EsasAssessment.create(patient_id: yiwang.id, clinician_id: rachellmiddleton.id, created_at: "2015-04-04 11:03:32 -0600", inputter_name: "Tania Abbot", inputter_id: care_aid.id, pain: 4, pain_comment: nil, tiredness: 6, tiredness_comment: nil, drowsiness: 6, drowsiness_comment: nil, nausea: 3, nausea_comment: nil, lack_of_appetite: 8, lack_of_appetite_comment: nil, shortness_of_breath: 2, shortness_of_breath_comment: nil, depression: 2, depression_comment: nil, wellbeing: 4, wellbeing_comment: nil, other_symptom_id: sweating.id, other_symptom_score: 9, other_symptom_comment: nil, esas_comment: nil)
EsasAssessment.create(patient_id: yiwang.id, clinician_id: rachellmiddleton.id, created_at: "2015-04-05 13:53:21 -0600", inputter_name: "Tania Abbot", inputter_id: care_aid.id, pain: 5, pain_comment: "little worse", tiredness: 5, tiredness_comment: nil, drowsiness: 5, drowsiness_comment: nil, nausea: 4, nausea_comment: nil, lack_of_appetite: 8, lack_of_appetite_comment: nil, shortness_of_breath: 4, shortness_of_breath_comment: nil, depression: 3, depression_comment: nil, wellbeing: 5, wellbeing_comment: nil, other_symptom_id: sweating.id, other_symptom_score: 6, other_symptom_comment: nil, esas_comment: "He is complaining about chest pains")
EsasAssessment.create(patient_id: yiwang.id, clinician_id: macariogarcia.id, created_at: "2015-04-06 15:43:21 -0600", inputter_name: "Louis Wang", inputter_id: son.id, pain: 4, pain_comment: nil, tiredness: 5, tiredness_comment: nil, drowsiness: 7, drowsiness_comment: nil, nausea: 3, nausea_comment: nil, lack_of_appetite: 7, lack_of_appetite_comment: nil, shortness_of_breath: 3, shortness_of_breath_comment: nil, depression: 3, depression_comment: nil, wellbeing: 4, wellbeing_comment: nil, other_symptom_id: sweating.id, other_symptom_score: 7, other_symptom_comment: nil, esas_comment: nil)

EsasAssessment.create(patient_id: apwinderbrar.id, clinician_id: rachellmiddleton.id, created_at: "2015-04-04 09:08:56 -0600", inputter_name: "Saranjit Brar", inputter_id: partner.id, pain: 7, pain_comment: nil, tiredness: 5, tiredness_comment: nil, drowsiness: 6, drowsiness_comment: nil, nausea: 8, nausea_comment: nil, lack_of_appetite: 7, lack_of_appetite_comment: nil, shortness_of_breath: 4, shortness_of_breath_comment: nil, depression: 5, depression_comment: nil, wellbeing: 6, wellbeing_comment: nil, other_symptom_id: urine.id, other_symptom_score: 4, other_symptom_comment: "Blood in urine", esas_comment: nil)
EsasAssessment.create(patient_id: apwinderbrar.id, clinician_id: debralin.id, created_at: "2015-04-06 08:43:21 -0600", inputter_name: "Saranjit Brar", inputter_id: partner.id, pain: 8, pain_comment: nil, tiredness: 6, tiredness_comment: nil, drowsiness: 5, drowsiness_comment: nil, nausea: 7, nausea_comment: nil, lack_of_appetite: 8, lack_of_appetite_comment: nil, shortness_of_breath: 5, shortness_of_breath_comment: nil, depression: 5, depression_comment: nil, wellbeing: 7, wellbeing_comment: nil, other_symptom_id: urine.id, other_symptom_score: 6, other_symptom_comment: "Brown in urine", esas_comment: "He is worried that he is feeling worse today")
EsasAssessment.create(patient_id: apwinderbrar.id, clinician_id: macariogarcia.id, created_at: "2015-04-08 09:04:34 -0600", inputter_name: "Saranjit Brar", inputter_id: partner.id, pain: 9, pain_comment: nil, tiredness: 5, tiredness_comment: nil, drowsiness: 7, drowsiness_comment: nil, nausea: 8, nausea_comment: nil, lack_of_appetite: 9, lack_of_appetite_comment: nil, shortness_of_breath: 5, shortness_of_breath_comment: nil, depression: 5, depression_comment: nil, wellbeing: 7, wellbeing_comment: nil, other_symptom_id: urine.id, other_symptom_score: 3, other_symptom_comment: "Slightly better today", esas_comment: nil)

# Create the scores for an PFRS assessment
PrfsAssessment.create(patient_id: johndoe.id, clinician_id: drmarshallsmith.id, created_at: "2015-04-05 17:46:32 -0600", inputter_name: "Jane Doe", inputter_id: partner.id, activity_and_function: 2, prfs_comment: nil)
PrfsAssessment.create(patient_id: cindypeters.id, clinician_id: joandixon.id, created_at: "2015-04-06 17:53:21 -0600", inputter_name: "Paul Ku", inputter_id: care_aid.id, activity_and_function: 3, prfs_comment: nil)

# Create the comments

Comment.create(patient_id: johndoe.id, clinician_id: drmarshallsmith.id, from: userdrmarshallsmith.id, created_at: "2015-04-05 13:26:32 -0600", general_comment: "Good. Please comment in the morning on how you feel")
Comment.create(patient_id: johndoe.id, clinician_id: drmarshallsmith.id, from: userjohndoe.id, created_at: "2015-04-05 14:39:01 -0600", general_comment: "Feeling good this morning. Thanks")
Comment.create(patient_id: johndoe.id, clinician_id: drmarshallsmith.id, from: userdrmarshallsmith.id, created_at: Faker::Time.between(2.days.ago, Time.now, :day), general_comment: Faker::Lorem.sentence(3, false, 4))
Comment.create(patient_id: johndoe.id, clinician_id: drmarshallsmith.id, from: userdrmarshallsmith.id, created_at: Faker::Time.between(2.days.ago, Time.now, :day), general_comment: "Praesent malesuada, enim vel rhoncus convallis, felis leo tempus diam.")
Comment.create(patient_id: johndoe.id, clinician_id: drmarshallsmith.id, from: userjohndoe.id, created_at: "2015-04-06 14:39:01 -0600", general_comment: "Vivamus bibendum est augue, vitae ultricies leo elementum sed. Suspendisse.")
Comment.create(patient_id: johndoe.id, clinician_id: drmarshallsmith.id, from: userdrmarshallsmith.id, created_at: "2015-04-07 13:26:32 -0600", general_comment: "Sed felis est, ullamcorper sed tellus vel, ullamcorper sodales mauris.")
Comment.create(patient_id: johndoe.id, clinician_id: drmarshallsmith.id, from: userjohndoe.id, created_at: "2015-04-07 14:39:01 -0600", general_comment: "Curabitur pharetra nisi a tellus elementum euismod. Curabitur eget bibendum.")
Comment.create(patient_id: johndoe.id, clinician_id: drmarshallsmith.id, from: userdrmarshallsmith.id, created_at: Faker::Time.between(7.days.ago, Time.now, :day), general_comment: Faker::Lorem.sentence(3, false, 4))
Comment.create(patient_id: johndoe.id, clinician_id: drmarshallsmith.id, from: userjohndoe.id, created_at: Faker::Time.between(7.days.ago, Time.now, :day), general_comment: Faker::Lorem.sentence(3, false, 4))
Comment.create(patient_id: johndoe.id, clinician_id: drmarshallsmith.id, from: userdrmarshallsmith.id, created_at: Faker::Time.between(7.days.ago, Time.now, :day), general_comment: Faker::Lorem.sentence(3, false, 4))
Comment.create(patient_id: johndoe.id, clinician_id: drmarshallsmith.id, from: userjohndoe.id, created_at: Faker::Time.between(7.days.ago, Time.now, :day), general_comment: Faker::Lorem.sentence(3, false, 4))
Comment.create(patient_id: johndoe.id, clinician_id: drmarshallsmith.id, from: userdrmarshallsmith.id, created_at: Faker::Time.between(7.days.ago, Time.now, :day), general_comment: Faker::Lorem.sentence(3, false, 4))
Comment.create(patient_id: johndoe.id, clinician_id: drmarshallsmith.id, from: userjohndoe.id, created_at: Faker::Time.between(7.days.ago, Time.now, :day), general_comment: Faker::Lorem.sentence(3, false, 4))

Comment.create(patient_id: benjaminlosseau.id, clinician_id: drmarshallsmith.id, from: userdrmarshallsmith.id, created_at: "2015-04-07 13:26:32 -0600", general_comment: "Good. Please comment in the morning on how you feel")
Comment.create(patient_id: benjaminlosseau.id, clinician_id: drmarshallsmith.id, from: userbenjaminlosseau.id, created_at: "2015-04-08 14:39:01 -0600", general_comment: "Feeling good this morning. Thanks")

Comment.create(patient_id: gcobisamaqanda.id, clinician_id: drmarshallsmith.id, from: userdrmarshallsmith.id, created_at: "2015-04-04 13:26:32 -0600", general_comment: "Good. Please comment in the morning on how you feel")
Comment.create(patient_id: gcobisamaqanda.id, clinician_id: drmarshallsmith.id, from: usergcobisamaqanda.id, created_at: "2015-04-06 14:39:01 -0600", general_comment: "Feeling good this morning. Thanks")

Comment.create(patient_id: apwinderbrar.id, clinician_id: macariogarcia.id, from: usermacariogarcia.id, created_at: "2015-04-04 09:08:56 -0600", general_comment: "Let me know if it's still bad tomorrow and we can schedule something from there")
Comment.create(patient_id: apwinderbrar.id, clinician_id: macariogarcia.id, from: userapwinderbrar.id, created_at: "2015-04-06 08:43:21 -0600", general_comment: "Seems like it was just a bad day")

# Create the notification settings
default = NotificationSetting.create(clinician_id: drmarshallsmith.id, esas_yellow_highest_symptom: 6, esas_yellow_increase_of: 3, esas_yellow_email: 0, esas_yellow_text: 0, esas_orange_highest_symptom: 8, esas_orange_increase_of: 4, esas_orange_email: 1, esas_orange_text: 0, esas_red_highest_symptom: 10, esas_red_increase_of: 5, esas_red_email: 1, esas_red_text: 1, prfs_yellow: 3, prfs_yellow_email: 0, prfs_yellow_text: 0, prfs_orange: 4, prfs_orange_email: 1, prfs_orange_text: 0, prfs_red: 5, prfs_red_email: 1, prfs_red_text: 1)


puts "There are now #{User.count} users, #{Clinician.count} clinicians, #{Patient.count} patients, #{Occupation.count} occupations, #{Inputter.count} inputter types, #{Gender.count} genders, #{CareGroup.count} care groups, #{EsasAssessment.count} scores for an ESAS assessment, #{PrfsAssessment.count} scores for a PFRS assessment, #{Comment.count} comments between patients and clinicians, and #{OtherSymptom.count} other symptoms in the database."