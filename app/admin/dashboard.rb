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
      column span: 2 do
        panel "Post Pubblicati: #{BlogPost.where(published: true) ? BlogPost.where(published: true).count : 'Nessuno'}" do
          if BlogPost.where(published: true).length > 0
            table_for BlogPost.where("published = true AND priority != 6") do |blog_post|
              column "Titolo" do |blog_post_link|
                link_to blog_post_link.title, admin_blog_post_path(blog_post_link)
              end
              column "Rubrica", :rubrica
              column "Lingua" do |blog_post_lang|
                case blog_post_lang.lang
                when 1
                  # "Italiano"
                  image_tag("lang_ita.svg", class: "admin_lang_icon")
                when 2
                  # "Inglese"
                  image_tag("lang_eng.svg", class: "admin_lang_icon")
                else
                  "-"
                end
              end
              # div link_to(blog_post.title, admin_blog_post_path(blog_post))
            end
          else
            h4 "Non ci sono post pubblicati."
          end
        end
      end
      column span: 1 do
        panel "Team Members: #{TeamMember.where(published: true) ? TeamMember.where(published: true).count : '0'}" do
          if TeamMember.where(published: true).length > 0
            TeamMember.where(published: true).order(:order).each do |member|
              div link_to("#{member.nome} #{member.cognome}", admin_team_member_path(member))
            end
          else
            h4 "Non ci sono membri del team pubblicati."
          end
        end
      end
    end
  end # content
end
