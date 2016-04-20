class CategoryFilmsController < ApplicationController
  before_action :set_category_film, only: [:show, :edit, :update, :destroy]

  # GET /category_films
  # GET /category_films.json
  def index
    @category_films = CategoryFilm.all
  end

  # GET /category_films/1
  # GET /category_films/1.json
  def show
  end

  # GET /category_films/new
  def new
    @category_film = CategoryFilm.new
  end

  # GET /category_films/1/edit
  def edit
  end

  # POST /category_films
  # POST /category_films.json
  def create
    @category_film = CategoryFilm.new(category_film_params)

    respond_to do |format|
      if @category_film.save
        format.html { redirect_to @category_film, notice: 'Category film was successfully created.' }
        format.json { render :show, status: :created, location: @category_film }
      else
        format.html { render :new }
        format.json { render json: @category_film.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /category_films/1
  # PATCH/PUT /category_films/1.json
  def update
    respond_to do |format|
      if @category_film.update(category_film_params)
        format.html { redirect_to @category_film, notice: 'Category film was successfully updated.' }
        format.json { render :show, status: :ok, location: @category_film }
      else
        format.html { render :edit }
        format.json { render json: @category_film.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category_films/1
  # DELETE /category_films/1.json
  def destroy
    @category_film.destroy
    respond_to do |format|
      format.html { redirect_to category_films_url, notice: 'Category film was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category_film
      @category_film = CategoryFilm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_film_params
      params.require(:category_film).permit(:category_of_game, :film_id)
    end
end
