ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    # Here is an example of a simple dashboard with columns and panels.
    #

    columns do
      column span: 2 do
        panel "Eventi Pubblicati: #{Event.where(published: true) ? Event.where(published: true).count : 'Nessuno'}" do
          if Event.where("published = true").length > 0
            table_for Event.where("published = true") do |event|
              column "Titolo" do |event_link|
                link_to event_link.titolo, admin_event_path(event_link)
              end
              column "Data di inizio", :data_inizio
              column "Categoria", :categoria
            end
          else
            h4 "Non ci sono eventi pubblicati."
          end
        end
      end
      column span: 3 do
        panel "Articoli WPAC: #{Article.where(published: true) ? Article.where(published: true).count : 'Nessuno'}" do
          if Article.where(published: true).length > 0
            table_for Article.where("published = true AND priority != 6") do |article|
              column "Titolo" do |article_link|
                link_to article_link.title, admin_article_path(article_link)
              end
              column "Media", :media_type
              list_column "Temi", :tag_list, class: "admin_tag"
            end
          else
            h4 "Non ci sono post pubblicati."
          end
        end
      end
      column span: 1 do
        panel "Team Members: #{TeamMember.where(published: true) ? TeamMember.where(published: true).count : '0'}" do
          if TeamMember.where(published: true).length > 0
            table_for TeamMember.where(published: true).order(:order) do |member|
              column "Nome" do |member_link|
                link_to("#{member_link.nome} #{member_link.cognome}", admin_team_member_path(member_link))
              end
              column "Ruolo", :ruolo
            end
          else
            h4 "Non ci sono membri del team pubblicati."
          end
        end
        panel "Welcome Onboard: #{Collaborator.where(published: true) ? Collaborator.where(published: true).count : '0'}" do
          if Collaborator.where(published: true).length > 0
            table_for Collaborator.where(published: true).order(:order) do |member|
              column "Nome" do |member_link|
                link_to("#{member_link.nome} #{member_link.cognome}", admin_collaborator_path(member_link))
              end
            end
          else
            h4 "Non ci sono collaboratori di Welcome Onboard pubblicati."
          end
        end
      end
    end
  end # content
end
