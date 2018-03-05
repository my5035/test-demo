
FactoryBot.define  do
  factory :grade_school, class:'GradeSchool' do
    sequence(:grade, 5)
    sequence(:name) {|n| "fred-#{n+1}"}
    enrolled 1
  end
end
