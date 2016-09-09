module Components
  module Home

    class CommentsListItem < React::Component::Base
      param :comment

      def render
        li do
          p {params.comment.body}
        end
      end

    end
  end
end
