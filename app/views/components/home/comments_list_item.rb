module Components
  module Home
    class CommentsListItem < React::Component::Base

      param :comment
      param :current_user, type: User

      define_state editing_comment: false

      def render
        li do
          if params.comment.user.id == current_user.id
            ReactBootstrap::Button(bsClass: "btn btn-default pull-right") do
              "Supprimer"
            end.on(:click) { params.comment.destroy }
            ReactBootstrap::Button(bsClass: "btn btn-success pull-right") do
              "Editer"
            end.on(:click) { state.editing_comment! true }
          end
          if state.editing_comment
            CommentEditItem(comment: params.comment).on(:save) { state.editing_comment! false}
          else
            p{params.comment.body}.on(:doubleClick) { state.editing_comment! true }
            p{"Posté par #{params.comment.user.email}"}
          end
        end
      end

    end
  end
end
