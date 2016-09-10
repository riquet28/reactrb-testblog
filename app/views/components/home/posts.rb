module Components
  module Home
    class PostsList < React::Component::Base
      define_state :new_post, ""

      before_mount do
        @posts = Post.all
      end

      def render
        section(class: "content") do
          div(class: "form-post") do
            div.jumbotron do
              h2(class: "titre-form-post") {"Vous avez quelque chose à dire ?"}
              new_post
            end
            h2(id: "liste-post") {"Liste des posts"}
            ul.list_unstyled do
              @posts.reverse.each do |post|
                div.jumbotron do
                  PostListItem(post: post)
                  if post.comments.blank?
                    h4 {"Il n'y a pas encore de commentaire pour ce post !"}
                  else
                    h4 {"Les commentaires pour ce post sont :"}
                  end
                  CommentsList(post: post)
                end
              end
            end
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
        post = Post.new(body: state.new_post)
        post.save do |result|
          alert "unable to save" unless result == true
        end
        state.new_post! ""
      end

    end

  end
end
