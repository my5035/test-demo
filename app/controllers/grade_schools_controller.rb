class GradeSchoolsController < ApplicationController
  before_action :set_grade_school, only: [:show, :edit, :update, :destroy]

  # GET /grade_schools
  # GET /grade_schools.json
  def index
    @search = GradeSchool.search params[:q]
    @grade_schools = @search.result.order(:grade, name: :desc)
  end

  # GET /grade_schools/1
  # GET /grade_schools/1.json
  def show
  end

  # GET /grade_schools/new
  def new
    @grade_school = GradeSchool.new
  end

  # GET /grade_schools/1/edit
  def edit
  end

  # POST /grade_schools
  # POST /grade_schools.json
  def create
    @grade_school = GradeSchool.new(grade_school_params)

    respond_to do |format|
      if @grade_school.save
        format.html { redirect_to grade_schools_path, notice: 'Grade school was successfully created.' }
        format.json { render :show, status: :created, location: @grade_school }
      else
        format.html { render :new }
        format.json { render json: @grade_school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grade_schools/1
  # PATCH/PUT /grade_schools/1.json
  def update
    respond_to do |format|
      if @grade_school.update(grade_school_params)
        format.html { redirect_to @grade_school, notice: 'Grade school was successfully updated.' }
        format.json { render :show, status: :ok, location: @grade_school }
      else
        format.html { render :edit }
        format.json { render json: @grade_school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grade_schools/1
  # DELETE /grade_schools/1.json
  def destroy
    @grade_school.destroy
    respond_to do |format|
      format.html { redirect_to grade_schools_url, notice: 'Grade school was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_grade_school
    @grade_school = GradeSchool.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def grade_school_params
    params.fetch(:grade_school, {}).permit!
  end
end
