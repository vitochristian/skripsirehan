class TrRfqSubmissionDtlsController < ApplicationController
  before_action :set_tr_rfq_submission_dtl, only: [:show, :edit, :update, :destroy]

  # GET /tr_rfq_submission_dtls
  # GET /tr_rfq_submission_dtls.json
  def index
    @tr_rfq_submission_dtls = TrRfqSubmissionDtl.all
  end

  # GET /tr_rfq_submission_dtls/1
  # GET /tr_rfq_submission_dtls/1.json
  def show
  end

  # GET /tr_rfq_submission_dtls/new
  def new
    @tr_rfq_submission_dtl = TrRfqSubmissionDtl.new
  end

  # GET /tr_rfq_submission_dtls/1/edit
  def edit
  end

  # POST /tr_rfq_submission_dtls
  # POST /tr_rfq_submission_dtls.json
  def create
    @tr_rfq_submission_dtl = TrRfqSubmissionDtl.new(tr_rfq_submission_dtl_params)

    respond_to do |format|
      if @tr_rfq_submission_dtl.save
        format.html { redirect_to @tr_rfq_submission_dtl, notice: 'Tr rfq submission dtl was successfully created.' }
        format.json { render :show, status: :created, location: @tr_rfq_submission_dtl }
      else
        format.html { render :new }
        format.json { render json: @tr_rfq_submission_dtl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tr_rfq_submission_dtls/1
  # PATCH/PUT /tr_rfq_submission_dtls/1.json
  def update
    respond_to do |format|
      if @tr_rfq_submission_dtl.update(tr_rfq_submission_dtl_params)
        format.html { redirect_to @tr_rfq_submission_dtl, notice: 'Tr rfq submission dtl was successfully updated.' }
        format.json { render :show, status: :ok, location: @tr_rfq_submission_dtl }
      else
        format.html { render :edit }
        format.json { render json: @tr_rfq_submission_dtl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tr_rfq_submission_dtls/1
  # DELETE /tr_rfq_submission_dtls/1.json
  def destroy
    @tr_rfq_submission_dtl.destroy
    respond_to do |format|
      format.html { redirect_to tr_rfq_submission_dtls_url, notice: 'Tr rfq submission dtl was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tr_rfq_submission_dtl
      @tr_rfq_submission_dtl = TrRfqSubmissionDtl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tr_rfq_submission_dtl_params
      params.require(:tr_rfq_submission_dtl).permit(:offered_qty, :price, :tr_rfq_submission_id)
    end
end
