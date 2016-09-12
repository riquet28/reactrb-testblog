module Components
  module Home
    class Show < React::Component::Base

      param :current_user, type:User

      def render
        div.section do
          PostsList(current_user: params.current_user)
        end
      end

    end
  end
end
