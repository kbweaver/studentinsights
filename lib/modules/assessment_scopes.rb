module AssessmentScopes

  def latest_assessment(family, subject)
    student = proxy_association.owner

    these_assessments = student.assessments.where(
      assessment_family_id: family.id,
      assessment_subject_id: subject.id
    )
    if these_assessments.present?
      these_assessments.order(date_taken: :asc).last
    else
      MissingAssessment.new
    end
  end

  def latest_mcas_ela
    latest_assessment(AssessmentFamily.mcas, AssessmentSubject.ela)
  end

  def latest_mcas_math
    latest_assessment(AssessmentFamily.mcas, AssessmentSubject.math)
  end

  def latest_star_reading
    latest_assessment(AssessmentFamily.star, AssessmentSubject.reading)
  end

  def latest_star_math
    latest_assessment(AssessmentFamily.star, AssessmentSubject.math)
  end

end