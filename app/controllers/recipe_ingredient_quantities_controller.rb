class RecipeIngredientQuantitiesController < ApplicationController
  # GET /recipe_ingredient_quantities
  # GET /recipe_ingredient_quantities.json
  def index
    @recipe_ingredient_quantities = RecipeIngredientQuantity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recipe_ingredient_quantities }
    end
  end

  # GET /recipe_ingredient_quantities/1
  # GET /recipe_ingredient_quantities/1.json
  def show
    @recipe_ingredient_quantity = RecipeIngredientQuantity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recipe_ingredient_quantity }
    end
  end

  # GET /recipe_ingredient_quantities/new
  # GET /recipe_ingredient_quantities/new.json
  def new
    @recipe_ingredient_quantity = RecipeIngredientQuantity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recipe_ingredient_quantity }
    end
  end

  # GET /recipe_ingredient_quantities/1/edit
  def edit
    @recipe_ingredient_quantity = RecipeIngredientQuantity.find(params[:id])
  end

  # POST /recipe_ingredient_quantities
  # POST /recipe_ingredient_quantities.json
  def create
    @recipe_ingredient_quantity = RecipeIngredientQuantity.new(params[:recipe_ingredient_quantity])

    respond_to do |format|
      if @recipe_ingredient_quantity.save
        format.html { redirect_to @recipe_ingredient_quantity, notice: 'Recipe ingredient quantity was successfully created.' }
        format.json { render json: @recipe_ingredient_quantity, status: :created, location: @recipe_ingredient_quantity }
      else
        format.html { render action: "new" }
        format.json { render json: @recipe_ingredient_quantity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recipe_ingredient_quantities/1
  # PUT /recipe_ingredient_quantities/1.json
  def update
    @recipe_ingredient_quantity = RecipeIngredientQuantity.find(params[:id])

    respond_to do |format|
      if @recipe_ingredient_quantity.update_attributes(params[:recipe_ingredient_quantity])
        format.html { redirect_to @recipe_ingredient_quantity, notice: 'Recipe ingredient quantity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @recipe_ingredient_quantity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_ingredient_quantities/1
  # DELETE /recipe_ingredient_quantities/1.json
  def destroy
    @recipe_ingredient_quantity = RecipeIngredientQuantity.find(params[:id])
    @recipe_ingredient_quantity.destroy

    respond_to do |format|
      format.html { redirect_to recipe_ingredient_quantities_url }
      format.json { head :no_content }
    end
  end
end
