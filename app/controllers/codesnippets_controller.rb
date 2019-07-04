class CodesnippetsController < ApplicationController
  before_action :set_codesnippet, only: [:show, :update, :destroy]

  # GET /codesnippets
  def index
    @codesnippets = Codesnippet.all

    render json: @codesnippets
  end

  # GET /codesnippets/1
  def show
    render json: @codesnippet
  end

  # POST /codesnippets
  def create
    @codesnippet = Codesnippet.new(codesnippet_params)

    if @codesnippet.save
      render json: @codesnippet, status: :created, location: @codesnippet
    else
      render json: @codesnippet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /codesnippets/1
  def update
    if @codesnippet.update(codesnippet_params)
      render json: @codesnippet
    else
      render json: @codesnippet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /codesnippets/1
  def destroy
    @codesnippet.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_codesnippet
      @codesnippet = Codesnippet.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def codesnippet_params
      params.require(:codesnippet).permit(:name, :code)
    end
end
