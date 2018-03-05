require "test_helper"

class GradeSchoolsControllerTest < ActionDispatch::IntegrationTest
  include FactoryBot::Syntax::Methods

  def setup
    @grade_school = GradeSchool.new
    (1..10).each{FactoryBot.create(:grade_school)}
  end

  test "get index" do
    get grade_schools_path
    assert_response :success
    assert_select ".title", "grade_school:"

    @grade_schools = assigns(:grade_schools)
    assert_not_nil @grade_schools

  end

  test "get index order grade" do
    get grade_schools_url
    @grade_schools = assigns(:grade_schools)
    assert @grade_schools[0].grade.to_i <= @grade_schools[1].grade.to_i
  end

  test "get index order name" do
    (1..10).each{FactoryBot.create(:grade_school)}

    get grade_schools_url, params: { q: { grade: 2 } }
    @grade_schools = assigns(:grade_schools)
    assert @grade_schools[0].name.to_s <= @grade_schools[1].name.to_s
  end

  test "get new" do
    get new_grade_school_path
    assert_response :success
  end

  test "post create" do
    assert_difference 'GradeSchool.count' do
      post '/grade_schools', params: { grade_school: { name: 'aaa', grade: 1 } }
    end

    assert_redirected_to grade_schools_url
  end

  test "get show" do
    @grade_school = GradeSchool.last
    get grade_school_url(@grade_school)
    assert_response :success
  end

  test "get edit" do
    @grade_school = GradeSchool.last
    get edit_grade_school_url(@grade_school)
    assert_response :success
  end

  test "patch update" do
    @grade_school = GradeSchool.first
    patch grade_school_url(@grade_school), params: { grade_school: { name: 'fred', grade: 1 } }
    assert_redirected_to grade_school_url(@grade_school)
  end

  test "delete destroy" do
    assert_difference('GradeSchool.count', -1) do
      delete grade_school_url(GradeSchool.last)
    end
    assert_redirected_to grade_schools_url
  end
end

# https://ruby-china.org/topics/26554
# https://github.com/mariovzc/rails_minitest_examples/blob/master/test/controllers/articles_controller_test.rb

#assert_difference explain

# before = GradeSchool.count # eval("GradeSchool.count")
# post :create, :post => { :title => 'Hi', :body => 'This is my first post.'}
# after = GradeSchool.count
# assert_equal after, before + 1

#assert_difference ‘Article.count’ do
#assert_difference [ ‘Article.count’, ‘Post.count’ ], 2 do
#assert_difference ->{ Article.count }, 2 do
# assert_difference [->{ Article.count }, ->{ Post.count }], 2 do
#   post :create, article: {…}
# end