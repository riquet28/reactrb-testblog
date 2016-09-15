module Components
  module Home
    class PostsList < React::Component::Base

      param :current_user, type: User

      define_state :new_post, ""

      export_state selected_user: nil

      before_mount do
        @posts = Post.all
      end

      def render
        section(class: "content") do
          div.col_md_9 do
            div(class: "form-post") do
              div.well do
                h2 {"Bonjour #{params.current_user.email},"}
                h2(class: "titre-form-post") {"Vous avez quelque chose à dire ?"}
                new_post
              end
              ul.list_unstyled do
                if selected_user
                  posts_selected = Post.for_user(selected_user)
                  h2(id: "liste-post") {"Liste des posts : #{posts_selected.count}"}
                  posts_selected.each do |post|
                    div.well do
                      PostListItem(post: post, current_user: current_user)
                      if post.comments.blank?
                        h4 {"Il n'y a pas encore de commentaire pour ce post !"}
                      else
                        h4 {"Les commentaires pour ce post : #{post.comments.count}"}
                      end
                      CommentsList(post: post, current_user: params.current_user)
                    end
                  end
                else
                  h2(id: "liste-post") {"Liste des posts : #{@posts.count}"}
                  @posts.reverse.each do |post|
                    div.well do
                      PostListItem(post: post, current_user: current_user)
                      if post.comments.blank?
                        h4 {"Il n'y a pas encore de commentaire pour ce post !"}
                      else
                        h4 {"Les commentaires pour ce post : #{post.comments.count}"}
                      end
                      CommentsList(post: post, current_user: params.current_user)
                    end
                  end
                end
              end
            end
          end
          div.col_md_3 do
            UsersPosts(post: Post.new)
          end
        end
      end

      def new_post
        ReactBootstrap::FormGroup() do
          ReactBootstrap::FormControl(
            placeholder: "Entrez votre post puis ENTRÉE ou cliquez sur le bouton \"Créer mon Post\"...",
            value: state.new_post,
            type: :text,
          ).on(:change) { |e|
            state.new_post! e.target.value
          }
        end.on(:key_down) do |e|
          if e.key_code == 13
            save_new_post
          end
        end
          ReactBootstrap::Button(bsClass: "btn btn-primary pull-right") do
            "Créer mon Post"
          end.on(:click) { save_new_post }
      end

      def save_new_post
        post = Post.new(body: state.new_post, user_id: params.current_user.id)
        post.save do |result|
          alert "unable to save" unless result == true
        end
        state.new_post! ""
        selected_user! nil
      end

    end

  end
end
