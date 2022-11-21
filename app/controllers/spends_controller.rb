class SpendsController < ApplicationController
  before_action :set_spend, only: %i[show edit update destroy]

  # GET /spends or /spends.json
  def index
    @spends = Spend.all
  end

  # GET /spends/1 or /spends/1.json
  def show; end

  # GET /spends/new
  def new
    @spend = Spend.new
  end

  # GET /spends/1/edit
  def edit; end

  # POST /spends or /spends.json
  def create
    @spend = Spend.new(spend_params)

    respond_to do |format|
      if @spend.save
        format.html { redirect_to spend_url(@spend), notice: 'Spend was successfully created.' }
        format.json { render :show, status: :created, location: @spend }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @spend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spends/1 or /spends/1.json
  def update
    respond_to do |format|
      if @spend.update(spend_params)
        format.html { redirect_to spend_url(@spend), notice: 'Spend was successfully updated.' }
        format.json { render :show, status: :ok, location: @spend }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @spend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spends/1 or /spends/1.json
  def destroy
    @spend.destroy

    respond_to do |format|
      format.html { redirect_to spends_url, notice: 'Spend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_spend
    @spend = Spend.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def spend_params
    params.require(:spend).permit(:name, :amount)
  end
end
