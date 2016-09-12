module Components
  class Store < React::Component::Base

    param :current_user, type: User

    export_state :current_user

    before_mount do
      Store.current_user! state.current_user
    end

    def render
      div do
        Home::Show(current_user: params.current_user)
      end
    end

  end
end
