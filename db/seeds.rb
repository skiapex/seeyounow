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
puts "Deleting all CareGiver from the database..."
CareGiver.delete_all
puts "Deleting all CareGroupAssignment from the database..."
CareGroupAssignment.delete_all


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
wife = Inputter.create(inputter_type: "Wife")
husband = Inputter.create(inputter_type: "Husband")
son = Inputter.create(inputter_type: "Son")
daughter = Inputter.create(inputter_type: "Daughter")
grandchild = Inputter.create(inputter_type: "Grandchild")
mother = Inputter.create(inputter_type: "Mother")
father = Inputter.create(inputter_type: "Father")
friend = Inputter.create(inputter_type: "Friend")
clinician = Inputter.create(inputter_type: "Medical team")
care_aid = Inputter.create(inputter_type: "Care aid")
sister = Inputter.create(inputter_type: "Sister")
brother = Inputter.create(inputter_type: "Brother")
soninlaw = Inputter.create(inputter_type: "Son in Law")
daughterinlaw = Inputter.create(inputter_type: "Daughter in Law")
other = Inputter.create(inputter_type: "Other")

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
hcadmin = Occupation.create(name: "Healthcare Administrator", pronym: nil, acronym: nil)
chpcn = Occupation.create(name: "Certified in Hospice and Palliative Care Nurse", pronym: nil, acronym: "RN, CHPCN")

puts "Creating specialities..."
# Create different specialist physicians
gp = Speciality.create(name: "Family Physician", occupation_id: physician.id)
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
perianesthesia_nursing = Speciality.create(name: "Peri Anesthesia Nursing", occupation_id: rn.id)
perinatal_nursing = Speciality.create(name: "Perinatal Nursing", occupation_id: rn.id)
perioperative_nursing = Speciality.create(name: "Perioperative Nursing", occupation_id: rn.id)
palliative_nursing = Speciality.create(name: "Palliative Nursing", occupation_id: rn.id)
psychiatric_nursing = Speciality.create(name: "Psychiatric and Mental Health Nursing", occupation_id: rn.id)
rehabilitation_nursing = Speciality.create(name: "Rehabilitation Nursing", occupation_id: rn.id)
rncns = Speciality.create(name: "Clinican Nurse Specialist", occupation_id: rn.id)

chpcn_cardiovascular_nursing = Speciality.create(name: "Cardiovascular Nursing", occupation_id: chpcn.id)
chpcn_community_nursing = Speciality.create(name: "Community Health Nursing", occupation_id: chpcn.id)
chpcn_critical_nursing = Speciality.create(name: "Critical Care Nursing", occupation_id: chpcn.id)
chpcn_pediatric_nursing = Speciality.create(name: "Critical Care Pediatric Nursing", occupation_id: chpcn.id)
chpcn_emergency_nursing = Speciality.create(name: "Emergency Nursing", occupation_id: chpcn.id)
chpcn_enterostomal_nursing = Speciality.create(name: "Enterostomal Therapy Nursing", occupation_id: chpcn.id)
chpcn_gastroenterology_nursing = Speciality.create(name: "Gastroenterology Nursing", occupation_id: chpcn.id)
chpcn_gerontological_nursing = Speciality.create(name: "Gerontological Nursing", occupation_id: chpcn.id)
chpcn_hospice_nursing = Speciality.create(name: "Hospice Palliative Care Nursing", occupation_id: chpcn.id)
chpcn_surgical_nursing = Speciality.create(name: "Medical-Surgical Nursing", occupation_id: chpcn.id)
chpcn_nephrology_nursing = Speciality.create(name: "Nephrology Nursing", occupation_id: chpcn.id)
chpcn_neuroscience_nursing = Speciality.create(name: "Neuroscience Nursing", occupation_id: chpcn.id)
chpcn_oh_nursing = Speciality.create(name: "Occupational Health Nursing", occupation_id: chpcn.id)
chpcn_oncology_nursing = Speciality.create(name: "Oncology Nursing", occupation_id: chpcn.id)
chpcn_orthopaedic_nursing = Speciality.create(name: "Orthopaedic Nursing", occupation_id: chpcn.id)
chpcn_perianesthesia_nursing = Speciality.create(name: "Peri Anesthesia Nursing", occupation_id: chpcn.id)
chpcn_perinatal_nursing = Speciality.create(name: "Perinatal Nursing", occupation_id: chpcn.id)
chpcn_perioperative_nursing = Speciality.create(name: "Perioperative Nursing", occupation_id: chpcn.id)
chpcn_palliative_nursing = Speciality.create(name: "Palliative Nursing", occupation_id: chpcn.id)
chpcn_psychiatric_nursing = Speciality.create(name: "Psychiatric and Mental Health Nursing", occupation_id: chpcn.id)
chpcn_rehabilitation_nursing = Speciality.create(name: "Rehabilitation Nursing", occupation_id: chpcn.id)
cns = Speciality.create(name: "Clinican Nurse Specialist", occupation_id: chpcn.id)

primary_health_care = Speciality.create(name: "Primary Health Care", occupation_id: nursepractitioner.id)
adult = Speciality.create(name: "Adult", occupation_id: nursepractitioner.id)
pediatric = Speciality.create(name: "Pediatric Care", occupation_id: nursepractitioner.id)
anaesthesia = Speciality.create(name: "Anaesthesia", occupation_id: nursepractitioner.id)

puts "Creating care groups..."
# Create different care groups
brameast = CareGroup.create(name: "Brameast", city: "Brampton", province: "ON", emergency_message: "INSTEAD OF CALLING 911 Your doctor and nurses would like you to call the Brameast Health Care Organization instead. From 8am-8pm call your CCAC nurse at (866) 570-8505, or Amanda at (416) 371-0733 or Dr. Maynard's office at (905) 792-2211. If this is after office hours have closed: from 8pm to 8am or on the weekend please call the on call Brameast physician at (416) 232-5094. Leave a message and your phone number twice so that the on call physician can call you back. Please speak clearly.")
systemadministration = CareGroup.create(name: "System Admin", city: "North Vancouver", province: "BC", emergency_message: "Contact info@seeyounow.ca")

# Create the users
puts "Creating users..."
#system administrator
useradmin = User.create(email: "info@seeyounow.ca", password: "W0930jk72")

# Patient users
usergailh = User.create(email: "gahis", password: "password")
useramrikg = User.create(email: "Amgos", password: "password")
useratnafug = User.create(email: "Atgob", password: "password")
userharbanss = User.create(email: "hamat", password: "password")
userlihwah = User.create(email: "lihsi", password: "password")
usernalinim = User.create(email: "NaMah", password: "password")
userritab = User.create(email: "Ribhu", password: "password")
userwalterh = User.create(email: "Wahus", password: "password")
userroyele = User.create(email: "roedw", password: "password")

# Clinician users
userjudymaynard = User.create(email: "judy.maynard@medportal.ca", password: "password")
useramandamaclennen = User.create(email: "palliate.brameast@rogers.com", password: "password")
userjenniferpebenito = User.create(email: "ebrameast@rogers.com", password: "password")

# Create the clinicians
puts "Creating clinicians..."

administrator = Clinician.create(first_name: "System", last_name: "Admin", occupation_id: physician.id, speciality_id: gp.id, gender_id: male.id, office_number: "(778) 791-4134", mobile_number: "(778) 791-4134", care_group_id: systemadministration.id, administrator: true, user_id: useradmin.id)


judymaynard = Clinician.create(first_name: "Judy", last_name: "Maynard", occupation_id: physician.id, speciality_id: gp.id, gender_id: female.id, office_number: "(905) 792-2212", mobile_number: "(416) 232-5094", care_group_id: brameast.id, administrator: true, user_id: userjudymaynard.id)
amandamaclennen = Clinician.create(first_name: "Amanda", last_name: "MacLennen", occupation_id: rn.id, speciality_id: palliative_nursing.id, gender_id: female.id, office_number: "(905) 792-2212", mobile_number: "(416) 371-0733", care_group_id: brameast.id, administrator: true, user_id: useramandamaclennen.id)
jenniferpebenito = Clinician.create(first_name: "Jennifer", last_name: "Pe Benito", occupation_id: rn.id, speciality_id: palliative_nursing.id, gender_id: female.id, office_number: "(905) 792-2212", mobile_number: "(416) 371-0733", care_group_id: brameast.id, administrator: true, user_id: userjenniferpebenito.id)

# Create the patients
puts "Creating patients..."

gailh = Patient.create(first_name: "Gail", last_name: "H", user_id: usergailh.id, diagnosis: "Ovarian cancer", diagnosis_date: "2013-03-01 00:00:01 -0400", gender_id: female.id, birth_date: "1946-08-28 00:00:01 -0400", address: "Hanover Road, Brampton, Ontario", phone_number: "1111111", goals_of_care: "stay at home as long as possible; fiercely independent and lives alone", important_to_you: "does not get along with sister Donna who should not be allowed in at the end", care_group_id: brameast.id, patient_deceased: false, patient_archived: false)
amrikg = Patient.create(first_name: "Amrik", last_name: "G", user_id: useramrikg.id, diagnosis: "Pseudomyxoma Peritonei and Dementia", diagnosis_date: "2014-01-26 00:00:01 -0400", gender_id: male.id, birth_date: "1926-08-28 00:00:01 -0400", address: "116 Eagleridge Drive, Brampton, Ontario", phone_number: "905-753-9323", other_symptom: nil, goals_of_care: "palliate", important_to_you: "Has increasing Dementia and he has lived along time with this diagnosis which no signs of terminal course; will likely die of dementia vs PMP", care_group_id: brameast.id, patient_deceased: false, patient_archived: false)
atnafug = Patient.create(first_name: "Atnafu", last_name: "G", user_id: useratnafug.id, diagnosis: "Leukemia", diagnosis_date: "2008-08-26 00:00:01 -0400", gender_id: male.id, birth_date: "1940-08-28 00:00:01 -0400", address: "1 Luella Cres, Brampton, Ontario", phone_number: "416-509-3740", other_symptom: nil, goals_of_care: "on chemo pill and doing very well", important_to_you: "Originates from Ethiopia; here with wife living with son and his grandkids", care_group_id: brameast.id, patient_deceased: false, patient_archived: false)
harbanss = Patient.create(first_name: "Harbans", last_name: "S", user_id: userharbanss.id, diagnosis: "B Cell Lymphoma", diagnosis_date: "2014-11-26 00:00:01 -0400", gender_id: male.id, birth_date: "1943-08-28 00:00:01 -0400", address: "4 Idaho Road, Brampton, Ontario", phone_number: "416-984-0173", other_symptom: nil, goals_of_care: "He wishes to die at home", important_to_you: "Wife does not want us to talk about his prognosis. She knows but would prefer to not hear anything of it.", care_group_id: brameast.id, patient_deceased: true, patient_archived: false)
lihwah = Patient.create(first_name: "Li Hwa", last_name: "H", user_id: userlihwah.id, diagnosis: "Non small cell Lung Cancer", diagnosis_date: "2006-08-26 00:00:01 -0400", gender_id: female.id, birth_date: "1959-08-28 00:00:01 -0400", address: "45 Solway Avenue, Brampton, Ontario", phone_number: "905-846-5907", other_symptom: nil, goals_of_care: "comfort and ongoing chemo; not interested in anymore lung biopsies as they pick up dead cells only times 3", important_to_you: "Dr. Nada rajah is her FD and she is not quite ready to switch to our service", care_group_id: brameast.id, patient_deceased: false, patient_archived: false)
nalinim = Patient.create(first_name: "Nalini", last_name: "M", user_id: usernalinim.id, diagnosis: "Metastatic colorectal cancer", diagnosis_date: "2015-01-26 00:00:01 -0400", gender_id: female.id, birth_date: "1974-08-28 00:00:01 -0400", address: "28 Lent Cres, Brampton, Ontario", phone_number: "289-752-8191", other_symptom: nil, goals_of_care: "She is aiming for cure. Will be having tumours surgically removed from the liver. Any treatments will be considered.", important_to_you: "She will likely set the pace of our visits ongoing", care_group_id: brameast.id, patient_deceased: false, patient_archived: false)
ritab = Patient.create(first_name: "Rita", last_name: "B", user_id: userritab.id, diagnosis: "Metastatic Breast Cancer in 2005", diagnosis_date: "2014-08-26 00:00:01 -0400", gender_id: female.id, birth_date: "1955-08-28 00:00:01 -0400", address: "147 Coastline Drive, Brampton, Ontario", phone_number: "905-453-5424", other_symptom: nil, goals_of_care: "palliate", important_to_you: "Strong Sikh religion and knows it is her god who will decide when it is time to go", care_group_id: brameast.id, patient_deceased: false, patient_archived: false)
walterh = Patient.create(first_name: "Walter", last_name: "H", user_id: userwalterh.id, diagnosis: "Metastatic Rectal Cancer", diagnosis_date: "2011-11-26 00:00:01 -0400", gender_id: male.id, birth_date: "1961-08-28 00:00:01 -0400", address: "13 Burt Drive, Brampton, Ontario", phone_number: "905-453-3651", other_symptom: nil, goals_of_care: "Be painfree and so far continue with chemotherapy despite side effects", important_to_you: "Originates from Newfoundland; has 3 kids", care_group_id: brameast.id, patient_deceased: true, patient_archived: true)
royele = Patient.create(first_name: "Royel", last_name: "E", user_id: userroyele.id, diagnosis: "Large B Cell Lymphoma", diagnosis_date: "2014-10-26 00:00:01 -0400", gender_id: male.id, birth_date: "1946-08-28 00:00:01 -0400", address: "40 Woodsend Run, Brampton, Ontario", phone_number: "647-222-1636", other_symptom: nil, goals_of_care: "palliate", important_to_you: "installed the Bell phones in our Brameast plaza; loved this work", care_group_id: brameast.id, patient_deceased: false, patient_archived: false)

puts "Creating care givers..."
# Create the are givers for patients
CareGiver.create(patient_id: gailh.id, inputter_id: grandchild.id, first_name: "Alexandra", last_name: "B", phone_number: nil, other_information: "granddaughter POA")
CareGiver.create(patient_id: amrikg.id, inputter_id: daughterinlaw.id, first_name: "Unknown", last_name: "G", phone_number: nil, other_information: nil)
CareGiver.create(patient_id: amrikg.id, inputter_id: wife.id, first_name: "Unknown", last_name: "G", phone_number: nil, other_information: nil)
CareGiver.create(patient_id: atnafug.id, inputter_id: son.id, first_name: "Unknown", last_name: "G", phone_number: nil, other_information: "patient lives with him")
CareGiver.create(patient_id: harbanss.id, inputter_id: son.id, first_name: "Sukvinder", last_name: "S", phone_number: nil, other_information: nil)
CareGiver.create(patient_id: harbanss.id, inputter_id: wife.id, first_name: "Unknown", last_name: "S", phone_number: nil, other_information: "does not want to hear prognosis")
CareGiver.create(patient_id: lihwah.id, inputter_id: daughter.id, first_name: "Samantha", last_name: "H", phone_number: nil, other_information: nil)
CareGiver.create(patient_id: nalinim.id, inputter_id: husband.id, first_name: "Unknown", last_name: "M", phone_number: nil, other_information: nil)
CareGiver.create(patient_id: ritab.id, inputter_id: husband.id, first_name: "Unknown", last_name: "X", phone_number: nil, other_information: nil)
CareGiver.create(patient_id: walterh.id, inputter_id: other.id, first_name: "Patty", last_name: "X", phone_number: nil, other_information: nil)
CareGiver.create(patient_id: royele.id, inputter_id: wife.id, first_name: "Caroline", last_name: "E", phone_number: nil, other_information: nil)


puts "Creating assessment scores..."
# Create the scores for an ESAS assessment
EsasAssessment.create(patient_id: gailh.id, clinician_id: judymaynard.id, clinician_completed: true, created_at: "2015-08-26 20:47:01 -0400", care_giver_id: nil, pain: 8, pain_comment: "using hydromorph contin 6 mg BID and does not want to use breakthrough unless absolutely necessary", tiredness: 8, tiredness_comment: "sleeping more and more", drowsiness: 1, drowsiness_comment: nil, nausea: 3, nausea_comment: "tumours in belly take her appetite away", lack_of_appetite: 3, lack_of_appetite_comment: nil, shortness_of_breath: 4, shortness_of_breath_comment: "no room for lungs to expand as belly gets bigger", depression: 0, depression_comment: nil, anxiety: 3, anxiety_comment: "sometimes abit anxious about falling if she goes out", wellbeing: 4, wellbeing_comment: "Doing better than she ever thought she would be doing at this stage", other_symptom_id: none.id, other_symptom_score: 0, other_symptom_comment: nil, esas_comment: "Severity at the time of assessment of each symptom rated from 0 to 10 on a numerical scale, 0 meaning that the symptom is absent and 10 that it is of the worst possible severity", resolution: nil, priority_resolved: false)

# Create the scores for an PRFS assessment
PrfsAssessment.create(patient_id: gailh.id, clinician_id: judymaynard.id, clinician_completed: true, created_at: "2015-08-26 21:01:01 -0400", care_giver_id: nil, activity_and_function: 2, prfs_comment: "still getting out with friends at mall occasionally; still driving; had bad fall and black eye last week in parking lot")


puts "Creating care group assignments..."
# Create the patient clinician relationship
CareGroupAssignment.create(clinician_id: judymaynard.id, patient_id: gailh.id)
CareGroupAssignment.create(clinician_id: jenniferpebenito.id, patient_id: gailh.id)
CareGroupAssignment.create(clinician_id: amandamaclennen.id, patient_id: gailh.id)

CareGroupAssignment.create(clinician_id: judymaynard.id, patient_id: amrikg.id)
CareGroupAssignment.create(clinician_id: jenniferpebenito.id, patient_id: amrikg.id)
CareGroupAssignment.create(clinician_id: amandamaclennen.id, patient_id: amrikg.id)

CareGroupAssignment.create(clinician_id: judymaynard.id, patient_id: atnafug.id)
CareGroupAssignment.create(clinician_id: jenniferpebenito.id, patient_id: atnafug.id)
CareGroupAssignment.create(clinician_id: amandamaclennen.id, patient_id: atnafug.id)

CareGroupAssignment.create(clinician_id: judymaynard.id, patient_id: harbanss.id)
CareGroupAssignment.create(clinician_id: jenniferpebenito.id, patient_id: harbanss.id)
CareGroupAssignment.create(clinician_id: amandamaclennen.id, patient_id: harbanss.id)

CareGroupAssignment.create(clinician_id: judymaynard.id, patient_id: lihwah.id)
CareGroupAssignment.create(clinician_id: jenniferpebenito.id, patient_id: lihwah.id)
CareGroupAssignment.create(clinician_id: amandamaclennen.id, patient_id: lihwah.id)

CareGroupAssignment.create(clinician_id: judymaynard.id, patient_id: nalinim.id)
CareGroupAssignment.create(clinician_id: jenniferpebenito.id, patient_id: nalinim.id)
CareGroupAssignment.create(clinician_id: amandamaclennen.id, patient_id: nalinim.id)

CareGroupAssignment.create(clinician_id: judymaynard.id, patient_id: ritab.id)
CareGroupAssignment.create(clinician_id: jenniferpebenito.id, patient_id: ritab.id)
CareGroupAssignment.create(clinician_id: amandamaclennen.id, patient_id: ritab.id)

CareGroupAssignment.create(clinician_id: judymaynard.id, patient_id: walterh.id)
CareGroupAssignment.create(clinician_id: jenniferpebenito.id, patient_id: walterh.id)
CareGroupAssignment.create(clinician_id: amandamaclennen.id, patient_id: walterh.id)

CareGroupAssignment.create(clinician_id: judymaynard.id, patient_id: royele.id)
CareGroupAssignment.create(clinician_id: jenniferpebenito.id, patient_id: royele.id)
CareGroupAssignment.create(clinician_id: amandamaclennen.id, patient_id: royele.id)


puts "Creating comments..."
# Create the comments


puts "Creating notes..."
# Create the comments

# Create the notification settings
puts "Creating notification settings..."
#default = NotificationSetting.create(clinician_id: ericacarter.id, esas_yellow_highest_symptom: 6, esas_yellow_increase_of: 3, esas_yellow_email: 0, esas_yellow_text: 0, esas_orange_highest_symptom: 8, esas_orange_increase_of: 4, esas_orange_email: 1, esas_orange_text: 0, esas_red_highest_symptom: 10, esas_red_increase_of: 5, esas_red_email: 1, esas_red_text: 1, prfs_yellow: 3, prfs_yellow_email: 0, prfs_yellow_text: 0, prfs_orange: 4, prfs_orange_email: 1, prfs_orange_text: 0, prfs_red: 5, prfs_red_email: 1, prfs_red_text: 1)
#default = NotificationSetting.create(clinician_id: kathylee.id, esas_yellow_highest_symptom: 6, esas_yellow_increase_of: 3, esas_yellow_email: 0, esas_yellow_text: 0, esas_orange_highest_symptom: 8, esas_orange_increase_of: 4, esas_orange_email: 1, esas_orange_text: 0, esas_red_highest_symptom: 10, esas_red_increase_of: 5, esas_red_email: 1, esas_red_text: 1, prfs_yellow: 3, prfs_yellow_email: 0, prfs_yellow_text: 0, prfs_orange: 4, prfs_orange_email: 1, prfs_orange_text: 0, prfs_red: 5, prfs_red_email: 1, prfs_red_text: 1)

puts "There are now #{User.count} users, #{Clinician.count} clinicians, #{Patient.count} patients, #{Occupation.count} occupations, #{Speciality.count} specialities, #{Inputter.count} inputter types, #{Gender.count} genders, #{CareGroup.count} care groups, #{EsasAssessment.count} scores for an ESAS assessment, #{PrfsAssessment.count} scores for a PFRS assessment, #{Comment.count} comments between patients and clinicians, #{Note.count} care notes added to patients, #{NotificationSetting.count} notification settings added to clinicians, and #{OtherSymptom.count} other symptoms in the database."