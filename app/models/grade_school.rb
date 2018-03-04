class GradeSchool < ApplicationRecord

  validates_presence_of :name, :grade

  ENROLLED_OPTION = [['true', 1], ['false', 0]]

  define_singleton_method :grade_options do
    (1..5).inject([]) { |r, s| r << [ 'grade ' + s.to_s, s]}
  end

  def enrolled?
    enrolled == 1
  end

  def enrolled_text
    (enrolled.to_i > 0).to_s
  end

  def grade_text
    'grade ' + grade.to_s
  end
end
