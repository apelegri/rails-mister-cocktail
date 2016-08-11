class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]
  def new
    @dose = Dose.new
    @ingredients = Ingredient.all
    @ingredients = @ingredients.map do |ingredient|
      ingredient.name
    end
  end

  def create
    @ingredient = Ingredient.find_by name: params[:dose][:ingredient_id]
    @dose = Dose.new(ingredient: @ingredient, description: params[:dose][:description])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient)
  end
end
