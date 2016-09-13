module Components
  module Home
    class Show < React::Component::Base

      param :current_user, type:User

      def render
        section do
          div(class: "col-md-9") do
            PostsList(current_user: params.current_user)
          end
          div(class: "col-md-3") do
            div.well do
              UsersPosts()
            end
          end
        end
      end

    end
  end
end
