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
      column do
        panel "Eventi" do
          if Event.all.length > 0
            Event.all.order(:created_at).each do |event|
              div link_to(event.titolo, admin_event_path(event))
            end
          else
            para "Non ci sono eventi."
          end
        end
      end
      column do
        panel "Post" do
          if BlogPost.all.length > 0
            table_for BlogPost.all.where("priority != 6").order(:created_at) do |blog_post|
              column "Titolo" do |blog_post_link|
                link_to blog_post_link.title, admin_blog_post_path(blog_post)
              end
              column "Lingua" do |blog_post|
                case blog_post.lang
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
            para "Non ci sono post."
          end
        end
      end
      column do
        panel "Team Members" do
          if TeamMember.all.length > 0
            TeamMember.all.order(:order).each do |member|
              div link_to("#{member.nome} #{member.cognome}", admin_team_member_path(member))
            end
          else
            para "Non ci sono membri del team."
          end
        end
      end
    end
  end # content
end
