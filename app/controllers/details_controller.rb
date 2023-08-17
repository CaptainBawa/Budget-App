class DetailsController < ApplicationController
  before_action :set_detail, only: %i[edit update destroy]

  # GET /details or /details.json
  def index
    @category = current_user.categories.find(params[:category_id])
    @details = @category.details.order(created_at: :desc)
  end

  # GET /details/1 or /details/1.json
  def show
    @detail = Detail.find_by(id: params[:id])
    @details = @detail.details.order(created_at: :desc)
  end

  # GET /details/new
  def new
    @detail = Detail.new
    @category = Category.find(params[:category_id])
    @categorys = Category.where(user_id: current_user.id)
  end

  # GET /details/1/edit
  def edit; end

  # POST /details or /details.json
  def create
    @category = Category.includes(:user).find_by(id: params[:category_id])
    @detail = Detail.new(detail_params)
    @detail.category_ids = [@category.id]
    @detail.user_id = current_user.id

    respond_to do |format|
      if @detail.save
        format.html { redirect_to category_details_path(@category), notice: 'Detail was successfully created.' }
        format.json { render :show, status: :created, location: @detail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /details/1 or /details/1.json
  def update
    respond_to do |format|
      if @detail.update(detail_params)
        format.html { redirect_to detail_url(@detail), notice: 'Detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @detail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /details/1 or /details/1.json
  def destroy
    @detail.destroy

    respond_to do |format|
      format.html { redirect_to details_url, notice: 'Detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_detail
    @detail = Detail.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def detail_params
    params.require(:detail).permit(:name, :amount)
  end
end
