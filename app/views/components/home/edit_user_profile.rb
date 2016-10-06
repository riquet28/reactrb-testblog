module Components
  module Home
    class EditUserProfile < React::Component::Base

      param :current_user, type: User
      param :on_save, type: Proc, allow_nil: true

      def render
        div do
          p { "Après avoir modifiez votre profil tapez ENTRÉE" }
          ReactBootstrap::FormGroup() do
            ReactBootstrap::FormControl(
            placeholder: "Entrez votre prénom et votre nom",
            value: params.current_user.lastname,
            type: :text,
            ).on(:change) do |e|
              params.current_user.lastname = e.target.value # as the user types update the body
            end.on(:key_down) do |e|
              if e.key_code == 13
                params.current_user.save
                params.on_save
              end
            end
            ReactBootstrap::FormControl(
            placeholder: "Entrez votre métier",
            value: params.current_user.function,
            type: :text,
            ).on(:change) do |e|
              params.current_user.function = e.target.value # as the user types update the body
            end.on(:key_down) do |e|
              if e.key_code == 13
                params.current_user.save
                params.on_save
              end
            end
            ReactBootstrap::FormControl(
            placeholder: "Choisissez un pseudo",
            value: params.current_user.nickname,
            type: :text,
            ).on(:change) do |e|
              params.current_user.nickname = e.target.value # as the user types update the body
            end.on(:key_down) do |e|
              if e.key_code == 13
                params.current_user.save
                params.on_save
              end
            end
            ReactBootstrap::FormControl(
            placeholder: "Entrez une url pour votre avatar",
            value: params.current_user.avatar,
            type: :text,
            ).on(:change) do |e|
              params.current_user.avatar = e.target.value # as the user types update the body
            end.on(:key_down) do |e|
              if e.key_code == 13
                params.current_user.save
                params.on_save
              end
            end
          end
        end
      end

    end
  end
end
