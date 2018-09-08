class RollmodeltestsController < ApplicationController
  before_action :set_rollmodeltest, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /rollmodeltests
  # GET /rollmodeltests.json
  def index
    @rollmodeltests = Rollmodeltest.all
  end

  # GET /rollmodeltests/1
  # GET /rollmodeltests/1.json
  def show
  end

  # GET /rollmodeltests/new
  def new
    @rollmodeltest = Rollmodeltest.new
  end

  # GET /rollmodeltests/1/edit
  def edit
  end

  # POST /rollmodeltests
  # POST /rollmodeltests.json
  def create
    @rollmodeltest = Rollmodeltest.new(rollmodeltest_params)

    respond_to do |format|
      if @rollmodeltest.save
        format.html { redirect_to @rollmodeltest, notice: 'Rollmodeltest was successfully created.' }
        format.json { render :show, status: :created, location: @rollmodeltest }
      else
        format.html { render :new }
        format.json { render json: @rollmodeltest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rollmodeltests/1
  # PATCH/PUT /rollmodeltests/1.json
  def update
    respond_to do |format|
      if @rollmodeltest.update(rollmodeltest_params)
        format.html { redirect_to @rollmodeltest, notice: 'Rollmodeltest was successfully updated.' }
        format.json { render :show, status: :ok, location: @rollmodeltest }
      else
        format.html { render :edit }
        format.json { render json: @rollmodeltest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rollmodeltests/1
  # DELETE /rollmodeltests/1.json
  def destroy
    @rollmodeltest.destroy
    respond_to do |format|
      format.html { redirect_to rollmodeltests_url, notice: 'Rollmodeltest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rollmodeltest
      @rollmodeltest = Rollmodeltest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rollmodeltest_params
      params.require(:rollmodeltest).permit(:name, :email)
    end
end
