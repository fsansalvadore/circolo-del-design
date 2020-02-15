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
        panel "Benvenuti" do
          para "Dal pannello Admin puoi gestire tutto ciò che riguarda gli Eventi e i Membri del Team."
        end
      end

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
