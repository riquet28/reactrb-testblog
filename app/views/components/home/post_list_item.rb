module Components
  module Home
    class PostListItem < React::Component::Base
      param :post

      def render
        li do
          h3{ "Titre du Post : \"#{params.post.body}...\"" }
          p{ "Posté le ... A FAIRE au bon format ... #{params.post.created_at}" }
          hr(class:"separateur-post-comment")
        end
      end

    end
  end
end
