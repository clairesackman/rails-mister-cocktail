class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(@cocktail_params)
    if @cocktail.save
      redirect_to "/cocktails/#{cocktail.id}"
      # redirect to cocktail_path(@cocktail)
      # [prefix]_path for static routes
      # [prefix]_path(arguments) for dynamic routes
    else
      render 'cocktails/new'
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
