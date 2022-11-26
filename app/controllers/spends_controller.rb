class SpendsController < ApplicationController
  before_action :set_spend, only: %i[show edit update destroy]
  before_action :set_group, only: %i[index new]

  # GET /spends or /spends.json
  def index
    @spends = @group.spends.order(created_at: :desc)
    @title = @group.name
  end

  # GET /spends/1 or /spends/1.json
  def show; end

  # GET /spends/new
  def new
    @spend = Spend.new
    @title = 'New Transaction'
    @spend.groups << @group
    @groups = current_user.groups
  end

  # GET /spends/1/edit
  def edit; end

  # POST /spends or /spends.json
  def create
    @spend = Spend.new(spend_params)
    @spend.author = current_user
    respond_to do |format|
      if @spend.save
        format.html { redirect_to group_spends_path, notice: "Transaction #{@spend.name} was successfully created." }
        format.json { render :show, status: :created, location: @spend }
      else
        @group = Group.find(params[:group_id])
        @groups = current_user.groups
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

  def set_group
    @group = Group.find(params[:group_id])
  end

  # Only allow a list of trusted parameters through.
  def spend_params
    params.require(:spend).permit(:name, :amount, group_ids: [])
  end
end
