module Components
  module Home

    class CommentsList < React::Component::Base
      param :post, type: Post
      define_state :new_comment, ""

      def render
        ul do
          params.post.comments.each do |comment|
            CommentsListItem(comment: comment)
          end
          new_comment
        end
      end

      def new_comment
        ReactBootstrap::FormGroup() do
          ReactBootstrap::FormControl(
            value: state.new_comment,
            type: :text,
          ).on(:change) { |e|
            state.new_comment! e.target.value
          }
        end
        ReactBootstrap::Button(bsStyle: :primary) do
          "Créer mon Commentaire"
        end.on(:click) { save_new_comment }
      end

      def save_new_comment
        comment = Comment.new(body: state.new_comment, post_id: params.post.id)
        comment.save do |result|
          post.comments << comment
          alert "unable to save" unless result == true
        end
        state.new_comment! ""
      end

    end #end class

  end
end
