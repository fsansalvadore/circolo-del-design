class CulturalProjectsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index, :show, :get_cultural_projects_by_month]
    before_action :set_cultural_project, only: [:show, :edit, :update, :destroy]

    def index
        @cultural_projects = CulturalProject.where("published = ?", true).order(start_date: :desc)
        if params[:query].present?
            sql_query = " \
                cultural_projects.titolo ILIKE :query \
                OR cultural_projects.sottotitolo ILIKE :query \
                OR cultural_projects.descrizione ILIKE :query \
                OR cultural_projects.categoria ILIKE :query \
            "
            @cultural_projects = @cultural_projects.where(sql_query, query: "%#{params[:query]}%")
        elsif params[:start_date].present?
            @cultural_projects = CulturalProject.where("extract(start_date from start_date) = ?", params[:start_date]).where(published: true).sort_by{ |e| [e.start_date, e.title] }
            @start_dateSelect = params[:start_date]
        else
            @cultural_projects = @cultural_projects.order(:start_date)
        end
    end

    def get_cultural_projects_by_month
        @cultural_projects = CulturalProject.where("published = ?", true).where("data_inizio OR data_fine = ?", params[:i])
    end

    def show
    end

    def new
        @cultural_project = CulturalProject.new
    end

    # def create
    #     @cultural_project = CulturalProject.new(cultural_projects_params)
    #     @cultural_project.save

    #     if @cultural_project.save
    #     redirect_to event_path(@cultural_project)
    #     else
    #     render :new
    #     end
    # end

    def edit
    end

    # def update
    #     @cultural_project.slug = nil if @cultural_project.titolo != params[:titolo]
    #     @cultural_project.update(cultural_projects_params)

    #     if @cultural_project.update(cultural_projects_params)
    #     redirect_to event_path(@cultural_project)
    #     else
    #     render :edit
    #     end
    # end

    def destroy
        @cultural_project.destroy
        redirect_to cultural_projects_path
    end

    private

    def set_cultural_project
        @cultural_project = CulturalProject.friendly.find_by_slug(params[:slug])
    end

    # def cultural_projects_params
    #     params.require(:cultural_project).permit(
    #         :title
    #         :intro_media_type
    #         :intro_image
    #         :intro_video
    #         :intro_video_provider
    #         :content
    #         :link_cta
    #         :link_url
    #         :start_date
    #         :cover
    #         :meta_keywords
    #         :meta_title
    #         :meta_description
    #         :slug
    #     )
    # end
end
