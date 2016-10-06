module Components
  module Home
    class CounterMembers < React::Component::Base

      param :user, type: User

      before_mount do
        @users = User.all
      end

      def render
        div(class: "panel panel-info panel-widget") do
          div(class: "panel-title text-center") do
            p {"Team Members"}.span.badge{"#{@users.count}"}
          end
          div.panel_body do
            ul(class: "basic-list image-list") do
              @users.each do |user|
                li do
                  div.row do
                    div.col_md_2 do
                      img
                    end
                    div.col_md_10 do
                      span {"#{user.lastname.present? ? user.lastname : user.email}"}
                      span.desc {"#{user.function.present? ? user.function : "Profil non rempli"}"}
                    end
                  end
                end
              end
            end
          end
        end
      end

    end
  end
end
