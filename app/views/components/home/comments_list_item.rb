module Components
  module Home
    class CommentsListItem < React::Component::Base

      param :comment

      define_state editing_comment: false

      def render
        li do
          ReactBootstrap::Button(bsClass: "btn btn-default pull-right") do
            "Supprimer"
          end.on(:click) { params.comment.destroy }
          ReactBootstrap::Button(bsClass: "btn btn-success pull-right") do
            "Editer"
          end.on(:click) { state.editing_comment! true }
          if state.editing_comment
            CommentEditItem(comment: params.comment).on(:save) { state.editing_comment! false}
          else
            p{params.comment.body}.on(:doubleClick) { state.editing_comment! true }
          end
        end
      end

    end
  end
end
