module ApplicationHelper
	def find_esas_assessment
		@esas_assessment = EsasAssessment.find_by(id: params["id"])
	end

	def permit_esas_assessment
		esas_assessment_params = params.require(:esas_assessment).permit(:patient_id, :clinician_id, :time, :year, :month, :day, :inputter_id, :pain, :pain_comment, :tiredness, :tiredness_comment, :drowsiness, :drowsiness_comment, :nausea, :nausea_comment, :lack_of_appetite, :lack_of_appetite_comment, :shortness_of_breath, :shortness_of_breath_comment, :depression, :depression_comment, :anxiety, :anxiety_comment, :wellbeing, :wellbeing_comment, :other_symptom_id, :other_symptom_score, :other_symptom_comment, :esas_comment)
	end
end
