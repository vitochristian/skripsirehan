class TrRfqSubmissionsController < ApplicationController
  before_action :set_tr_rfq_submission, only: [:show, :edit, :update, :destroy]

  # GET /tr_rfq_submissions
  # GET /tr_rfq_submissions.json
  def index
    @tr_rfq_submissions = TrRfqSubmission.all

  end

  # GET /tr_rfq_submissions/1
  # GET /tr_rfq_submissions/1.json
  def show
  end

  # GET /tr_rfq_submissions/new
  def new
    @tr_rfq_submission = TrRfqSubmission.new
  end

  # GET /tr_rfq_submissions/1/edit
  def edit
  end

  # POST /tr_rfq_submissions
  # POST /tr_rfq_submissions.json
  def create
    @tr_rfq_submission = TrRfqSubmission.new(tr_rfq_submission_params)

    respond_to do |format|
      if @tr_rfq_submission.save
        format.html { redirect_to inquiries_path, notice: 'Quotation was successfully created.' }
        format.json { render :show, status: :created, location:inquiries_path }

      else
        format.html { render :new }
        format.json { render json: @tr_rfq_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tr_rfq_submissions/1
  # PATCH/PUT /tr_rfq_submissions/1.json
  def update
    respond_to do |format|
      if @tr_rfq_submission.update(tr_rfq_submission_params)
        format.html { redirect_to @tr_rfq_submission, notice: 'Tr rfq submission was successfully updated.' }
        format.json { render :show, status: :ok, location: @tr_rfq_submission }
      else
        format.html { render :edit }
        format.json { render json: @tr_rfq_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tr_rfq_submissions/1
  # DELETE /tr_rfq_submissions/1.json
  def destroy
    @tr_rfq_submission.destroy
    respond_to do |format|
      format.html { redirect_to tr_rfq_submissions_url, notice: 'Tr rfq submission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tr_rfq_submission
      @tr_rfq_submission = TrRfqSubmission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tr_rfq_submission_params
      # params.require(:tr_rfq_submission).permit(:bidding_types, :description, :need_by_date, :term_of_payment, :no_quotation, :incoterms, :note, :is_active, :created_by, :updated_by)
      params.require(:tr_rfq_submission).permit! #(:bidding_types, :description, :need_by_date, :term_of_payment, :no_quotation, :incoterms, :note, :is_active, :created_by, :updated_by)
    end
end
