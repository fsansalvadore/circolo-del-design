class SpecialProjectsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index, :show, :get_special_projects_by_month]
    before_action :set_special_project, only: [:show, :edit, :update, :destroy]

    def index
        @special_projects = SpecialProject.where("published = ?", true).order(year: :desc)
        if params[:query].present?
        sql_query = " \
            special_projects.titolo ILIKE :query \
            OR special_projects.sottotitolo ILIKE :query \
            OR special_projects.descrizione ILIKE :query \
            OR special_projects.categoria ILIKE :query \
        "
        @special_projects = @special_projects.where(sql_query, query: "%#{params[:query]}%")
        elsif params[:year].present?
        @special_projects = SpecialProject.where("extract(year from year) = ?", params[:year]).where(published: true).sort_by{ |e| [e.year, e.title] }
        @yearSelect = params[:year]
        else
        @special_projects = @special_projects.order(:year)
        end
    end

    def get_special_projects_by_month
        @special_projects = SpecialProject.where("published = ?", true).where("data_inizio OR data_fine = ?", params[:i])
    end

    def show
    end

    def new
        @special_project = SpecialProject.new
    end

    # def create
    #     @special_project = SpecialProject.new(special_projects_params)
    #     @special_project.save

    #     if @special_project.save
    #     redirect_to event_path(@special_project)
    #     else
    #     render :new
    #     end
    # end

    def edit
    end

    # def update
    #     @special_project.slug = nil if @special_project.titolo != params[:titolo]
    #     @special_project.update(special_projects_params)

    #     if @special_project.update(special_projects_params)
    #     redirect_to event_path(@special_project)
    #     else
    #     render :edit
    #     end
    # end

    def destroy
        @special_project.destroy
        redirect_to special_projects_path
    end

    private

    def set_special_project
        @special_project = SpecialProject.friendly.find_by_slug(params[:slug])
    end

    # def special_projects_params
    #     params.require(:special_project).permit(
    #         :title
    #         :intro_media_type
    #         :intro_image
    #         :intro_video
    #         :intro_video_provider
    #         :content
    #         :link_cta
    #         :link_url
    #         :year
    #         :cover
    #         :meta_keywords
    #         :meta_title
    #         :meta_description
    #         :slug
    #     )
    # end
end
