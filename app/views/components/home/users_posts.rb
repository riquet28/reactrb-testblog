module Components
  module Home
    class UsersPosts < React::Component::Base

      param :post, type: Post
      define_state :increment_post

      before_mount do
        state.increment_post! Post.new
        @users = User.all
      end

      def render
        div.well do
          h4{"Ils ont postés :"}
          hr
          p{"Un peu de texte qui sert a rien pour le moment"}
          @users.each do |user|
            if user.posts.count > 0
              div.row do
                div.col_md_8 do
                  p{"#{user.email} : #{user.posts.count}"}
                end
                div.col_md_4 do
                  ReactBootstrap::Button(bsClass: "btn btn-primary pull-right") do
                    "Voir"
                  end
                end
              end
            end
          end
        end
      end

    end
  end
end
