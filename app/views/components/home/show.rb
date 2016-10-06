module Components
  module Home
    class Show < React::Component::Base

      param :current_user, type:User

      def render
        section do
          div.col_md_12 do
            PostsList(current_user: params.current_user)
          end
        end
      end

    end
  end
end
