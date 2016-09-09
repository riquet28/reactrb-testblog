module Components
  module Home

    class CommentsListItem < React::Component::Base
      param :comment

      def render
        li do
          ReactBootstrap::Button(bsClass: "btn btn-default pull-right") do
            "Détruire ce Commentaire"
          end.on(:click) { params.comment.destroy }
          p{params.comment.body}
        end
      end

    end
  end
end
