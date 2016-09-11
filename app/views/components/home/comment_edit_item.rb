module Components
  module Home
    class CommentEditItem < React::Component::Base

      param :comment
      param :on_save, type: Proc, allow_nil: true

      def render
        div do
          p  { "Après avoir modifiez votre commentaire tapez ENTRÉE" }
          ReactBootstrap::FormGroup() do
            ReactBootstrap::FormControl(
            placeholder: "Modifiez votre commentaire puis ENTRÉE",
            value: params.comment.body,
            type: :text,
            ).on(:change) do |e|
              params.comment.body = e.target.value # as the user types update the body
            end.on(:key_down) do |e|
              if e.key_code == 13
                params.comment.save
                params.on_save
              end
            end
          end
        end
      end

    end
  end
end
