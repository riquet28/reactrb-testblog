module Components
  module Home
    class CommentsListItem < React::Component::Base

      param :comment
      param :current_user, type: User

      define_state editing_comment: false

      def render
        li do
          if state.editing_comment
            CommentEditItem(comment: params.comment).on(:save) { state.editing_comment! false}
          else
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
                      div.name do
                        p{"Posté par #{params.comment.user.email}"}
                      end
                      div.text do
                        div.row do
                          div.col_md_12 do
                            p{params.comment.body}.on(:doubleClick) { state.editing_comment! true }
                          end
                        end
                        if params.comment.user.id == current_user.id
                          div.row do
                            div.col_md_12 do
                              ReactBootstrap::Button(bsClass: "btn btn-default pull-right") do
                                "Supprimer"
                              end.on(:click) { params.comment.destroy }
                              ReactBootstrap::Button(bsClass: "btn btn-success pull-right") do
                                "Editer"
                              end.on(:click) { state.editing_comment! true }
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
