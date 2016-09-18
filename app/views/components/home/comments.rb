module Components
  module Home

    class CommentsList < React::Component::Base
      param :post, type: Post
      param :current_user, type: User
      define_state :new_comment, ""

      def render
        ul.list_unstyled do
          params.post.comments.each do |comment|
            CommentsListItem(comment: comment, current_user: params.current_user)
          end
          new_comment
        end
      end

      def new_comment
        div(class: "row margin-form-comment") do
          div.col_md_9 do
            ReactBootstrap::FormGroup() do
              ReactBootstrap::FormControl(
                placeholder: "Votre commentaire puis ENTRÉE ou cliquez sur le bouton \"Créer mon Commentaire\"...",
                value: state.new_comment,
                type: :text,
              ).on(:change) { |e|
                state.new_comment! e.target.value
              }
            end.on(:key_down) do |e|
              if e.key_code == 13
                save_new_comment
              end
            end
          end
          div.col_md_3 do
            ReactBootstrap::Button(bsStyle: :primary) do
              "Créer mon Commentaire"
            end.on(:click) { save_new_comment }
          end
        end
      end

      def save_new_comment
        comment = Comment.new(body: state.new_comment,
                              post_id: params.post.id,
                              user_id: params.current_user.id)
        comment.save do |result|
          post.comments << comment
          alert "unable to save" unless result == true
        end
        state.new_comment! ""
      end

    end #end class

  end
end
