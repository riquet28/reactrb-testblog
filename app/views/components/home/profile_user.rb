module Components
  module Home
    class ProfileUser < React::Component::Base

      param :current_user, type: User
      param :post, type: Post
      param :comment, type: Comment
      param :on_save, type: Proc, allow_nil: true

      define_state editing_name: false

      def render
        div(class:"box box-widget widget-user") do
          div(class:"widget-user-header bg-aqua") do
            h3(class:"widget-user-username") {"#{params.current_user.lastname}"}
            h5(class:"widget-user-desc") {"#{params.current_user.function}"}
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
                button.btn.btn_primary { "Mettre à jour mon profil" }.on(:click) { state.editing_name! true }
                if state.editing_name
                  EditUserProfile(current_user: params.current_user).on(:save) { state.editing_name! false }
                end
              end
            end
          end
        end
      end

    end
  end
end
