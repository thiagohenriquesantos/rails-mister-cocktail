class CocktailsController < ApplicationController
  before_action :set_cocktail, only: %i[show update]
  def index
    @cocktails = Cocktail.all
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
  end

  def update
    set_photo_params
    if @cocktail.update(cocktail_params)
      render json: { success: 'sucesso!'}
    else
      render :show
    end
  end

  def destroy
  end

  private

  def set_photo_params
    params[:cocktail][:photo] = params[:file]
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
