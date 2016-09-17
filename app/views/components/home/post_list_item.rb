module Components
  module Home
    class PostListItem < React::Component::Base
      param :post, type: Post
      param :current_user, type:User

      define_state editing_post: false

      def render
        li do
          if state.editing_post
            PostEditItem(post: params.post).on(:save) { state.editing_post! false}
          else
            div.row do
              div(class: "col-md-12 margin-btm-20") do
                div(class: "quote green") do
                  blockquote do
                    h3{ "Titre du Post : \"#{params.post.body}...\"" }.on(:doubleClick) { state.editing_post! true }
                    p {"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s."}
                  end
                end
                div(class: "quote-footer text-right") do
                  div(class: "quote-author-img") do
                    img
                  end
                  h4 {"Rakesh Sharma"}
                  p.strong {"Design_mylife"}
                end
              end
            end
          end


          if params.post.user.id == current_user.id
            ReactBootstrap::Button(bsClass: "btn btn-danger pull-right") do
              "Détruire ce Post"
            end.on(:click) { destroy_post }
            ReactBootstrap::Button(bsClass: "btn btn-success pull-right") do
              "Modifier ce Post"
            end.on(:click) { state.editing_post! true }
            else
            span.badge(class:"pull-right") {"Non proprio du post !!!"}
          end
          p{ "Posté le ... A FAIRE au bon format ... #{params.post.created_at} par #{params.post.user.email}" }
          hr(class:"separateur-post-comment")
        end
      end

      def destroy_post
        params.post.destroy
        # Marche mais renvoie erreur
        # class_methods.self-06c2020….js?body=1:57 Exception raised while rendering #<CommentsList:0x922>
        # NoMethodError: undefined method `each' for nil
      end

    end
  end
end
