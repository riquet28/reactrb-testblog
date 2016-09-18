module Components
  module Home
    class UsersPosts < React::Component::Base

      param :post, type: Post

      def render
        div.well do
          users = User.all
          users.each do |user|
            if user.posts.count > 0
              div.row do
                div.col_md_8 do
                  p{"#{user.email} : #{user.posts.count}"}
                end
                div.col_md_4 do
                  ReactBootstrap::Button(bsClass: "btn btn-primary pull-right") do
                    "Voir"
                  end.on(:click) { PostsList.selected_user! user.id }
                end
              end
            end
          end
          div.row do
            div.col_md_12 do
              ReactBootstrap::Button(bsClass: "btn btn-danger pull-right") do
                "Voir tous les posts"
              end.on(:click) { state.selected_user! nil }
            end
          end
        end
      end

    end
  end
end
