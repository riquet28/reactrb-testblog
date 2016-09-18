module Components
  module Home
    class CommentsListItem < React::Component::Base

      param :comment
      param :current_user, type: User

      define_state editing_comment: false

      def render
        li do
          div.row do
            div(class: "col-md-12 chat") do
              div(class: "col-inside-lg decor-default") do
                div(class: "chat-body") do
                  div(class: "answer right") do
                    div(class: "avatar") do
                      img
                      div(class:"status offline") do
                      end
                    end
                    div.text do
                      div.row do
                        div.col_md_2 do
                          if params.comment.user.id == current_user.id
                            i.fa.fa_edit.on(:click) { state.editing_comment! true }
                            i.fa.fa_trash_o.on(:click) { params.comment.destroy }
                          end
                        end
                        div.col_md_10 do
                          div.name do
                            p{"Posté par #{params.comment.user.email}"}
                            p{params.comment.body}.on(:doubleClick) { state.editing_comment! true }
                            if state.editing_comment
                              CommentEditItem(comment: params.comment).on(:save) { state.editing_comment! false}
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
        end
      end

    end
  end
end
