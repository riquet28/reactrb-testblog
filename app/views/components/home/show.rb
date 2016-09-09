module Components
  module Home
    class Show < React::Component::Base

      def render
        div.section do
          PostsList()
        end
      end

    end
  end
end
