class SearchesController < ApplicationController
  
  respond_to :html, :js, :json

  def new
    @search = Search.new
    @categories=Film.uniq.pluck(:category)
    respond_modal_with  @search 
  end

  def search_film
    search_films
    render "show"
  end
 
  private
  
  def search_films
    film=Film.all

    @films=film.where(["title LIKE ?", save_title(params[:search][:title])]) if  params[:search][:title].present?
    @films=film.where(["year LIKE ?", save_title(params[:search][:year])]) if  params[:search][:year].present?
    @films=film.where(["language LIKE ?", save_title(params[:search][:language])]) if  params[:search][:language].present?
    @films=film.where(["actor LIKE ?", save_title(params[:search][:actor])]) if  params[:search][:actor].present?
    @films=film.where(["subtitle LIKE ?", save_title(params[:search][:subtitle])]) if  params[:search][:subtitle].present?
    @films=@films.paginate(:page => params[:page], :per_page => Configurable['films_per_page'])
  end
    # Use callbacks to share common setup or constraints between actions.
   
    # Never trust parameters from the scary internet, only allow the white list through.
    def search_params
      params.require(:search).permit(:title, :year, :actor, :language, :subtitle)
    end

end
