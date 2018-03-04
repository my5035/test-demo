require "test_helper"

class GradeSchoolTest < ActiveSupport::TestCase
  def setup
    @grade_school ||= GradeSchool.new
  end

  test "grade school field need presence" do
    @grade_school.grade = nil
    assert_not @grade_school.save
  end

  test "name need presence" do
    @grade_school.name = nil
    assert_not @grade_school.save
  end

  test 'enrolled test' do
    @grade_school.enrolled = 1
    assert @grade_school.enrolled?
  end

  test 'enrolled_text test' do
    @grade_school.enrolled = 1
    assert_equal @grade_school.enrolled_text, 'true'
  end

  # test msg
  test 'grade_text test' do
    @grade_school.grade = 1
    assert_equal @grade_school.grade_text, 'grade 1'
  end

  it "must be valid" do
    @grade_school.grade = 2
    assert_equal @grade_school.grade_text, 'grade 2'
  end

end
