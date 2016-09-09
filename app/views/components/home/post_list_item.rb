module Components
  module Home
    class PostListItem < React::Component::Base
      param :post

      def render
        li do
          ReactBootstrap::Button(bsClass: "btn btn-danger pull-right") do
            "Détruire ce Post"
          end.on(:click) { destroy_post }
          h3{ "Titre du Post : \"#{params.post.body}...\"" }
          p{ "Posté le ... A FAIRE au bon format ... #{params.post.created_at}" }
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
