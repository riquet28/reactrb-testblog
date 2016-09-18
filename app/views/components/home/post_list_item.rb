module Components
  module Home
    class PostListItem < React::Component::Base

      param :post, type: Post
      param :current_user, type:User

      define_state editing_post: false

      def render
        li do
          div.row do
            div(class: "col-md-12 margin-btm-20") do
              div(class: "quote green") do
                blockquote do
                  div.row do
                    div.col_md_9 do
                      p(class: "post-paragraphe"){ "Posté le ... A FAIRE au bon format ... #{params.post.created_at} par #{params.post.user.email}" }
                      p { "Titre du Post : \"#{params.post.body}...\"" }.on(:doubleClick) { state.editing_post! true }
                      if params.post.user.id == current_user.id
                        if state.editing_post
                          PostEditItem(post: params.post).on(:save) { state.editing_post! false}
                        end
                      end
                    end
                    div.col_md_3.text_center do
                      if params.post.user.id == current_user.id
                        ReactBootstrap::Button(bsClass: "btn btn-success post-button") do
                          "Modifier"
                        end.on(:click) { state.editing_post! true }
                        ReactBootstrap::Button(bsClass: "btn btn-danger post-button") do
                          "Supprimer"
                        end.on(:click) { destroy_post }
                      else
                        span.badge {"Non modifiable"}
                      end
                    end
                  end
                end
              end
              div(class: "quote-footer text-right") do
                div(class: "quote-author-img") do
                  img
                end
                if post.comments.blank?
                  h4 {"Il n'y a pas encore de commentaire pour ce post... Be the first!"}
                else
                  h4 {"Les commentaires pour ce post : #{post.comments.count}"}
                end
              end
            end
          end
        end
      end

      def destroy_post
        params.post.destroy
      end

    end
  end
end
