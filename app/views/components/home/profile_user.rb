module Components
  module Home
    class ProfileUser < React::Component::Base

      param :current_user, type: User
      param :post, type: Post
      param :comment, type: Comment

      def render
        div(class:"box box-widget widget-user") do
          div(class:"widget-user-header bg-aqua") do
            h3(class:"widget-user-username") {"Alexander Pierce"}
            h5(class:"widget-user-desc") {"Founder &amp; CEO"}
          end
          div(class:"widget-user-image") do
            img(class:"img-circle")
          end
          div(class:"box-footer") do
            CounterPostsComments(post: params.post, comment: params.comment)
          end
          div.row do
            div.col_md_12 do
              div(class:"pad-ver text-center") do
                button.btn.btn_primary { "Nom" }
                button.btn.btn_primary { "Avatar" }
                button.btn.btn_primary { "Pseudo" }
                button.btn.btn_primary { "Poste" }
              end
            end
          end
        end
      end

    end
  end
end
