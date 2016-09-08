module Components
  module Home

    class CommentsList < React::Component::Base
      param :comments
      define_state :new_comment, ""

      before_mount do
        # note that this will lazy load posts
        # and only the fields that are needed will be requested
      end

      def render
        ul do
          params.comments.each do |comment|
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

      def post_id
        params.comments.first.id.to_i
      end

      def save_new_comment
        comment = Comment.new(body: state.new_comment, post_id: 9)
        comment.save do |result|
          # note that save is a promise so this code will only run after the save
          # yet react will move onto the code after this (before the save happens)
          alert "unable to save" unless result == true
        end
        state.new_comment! ""
      end

    end #end class


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
