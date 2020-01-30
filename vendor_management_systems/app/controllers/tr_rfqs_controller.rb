class TrRfqsController < ApplicationController
  before_action :set_tr_rfq, only: [:show, :edit, :update, :destroy]

  # GET /tr_rfqs
  # GET /tr_rfqs.json
  def index
    @tr_rfqs = TrRfq.all
  end

  # GET /tr_rfqs/1
  # GET /tr_rfqs/1.json
  def show
  end

  # GET /tr_rfqs/new
  def new
    @tr_rfq = TrRfq.new
    @ms_vendor_types = MsVendorType.active_only.map { |e| [e.type_name , e.id]  }
  end

  # GET /tr_rfqs/1/edit
  def edit
    @ms_vendor_types = MsVendorType.active_only.map { |e| [e.type_name , e.id]  }
  end

  # POST /tr_rfqs
  # POST /tr_rfqs.json
  def create
    @tr_rfq = TrRfq.new(tr_rfq_params)

    respond_to do |format|
      if @tr_rfq.save
        format.html { redirect_to @tr_rfq, notice: 'Tr rfq was successfully created.' }
        format.json { render :show, status: :created, location: @tr_rfq }
      else
        format.html { render :new }
        format.json { render json: @tr_rfq.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tr_rfqs/1
  # PATCH/PUT /tr_rfqs/1.json
  def update
    respond_to do |format|
      if @tr_rfq.update(tr_rfq_params)
        format.html { redirect_to @tr_rfq, notice: 'Tr rfq was successfully updated.' }
        format.json { render :show, status: :ok, location: @tr_rfq }
      else
        format.html { render :edit }
        format.json { render json: @tr_rfq.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tr_rfqs/1
  # DELETE /tr_rfqs/1.json
  def destroy
    @tr_rfq.destroy
    respond_to do |format|
      format.html { redirect_to tr_rfqs_url, notice: 'Tr rfq was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tr_rfq
      @tr_rfq = TrRfq.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tr_rfq_params
      params.require(:tr_rfq).permit(:no_rfq, :uom, :qty, :expiration_date, :ms_vendor_type_id, :item_name, :delivery_site, :note, :description, :need_by_date, :term_of_payment, :is_active, :created_by, :updated_by, :status)
    end
end
