module Components
  module Home
    class PostEditItem < React::Component::Base

      param :post
      param :on_save, type: Proc, allow_nil: true

      def render
        div do
          p(class: "para-edit-post")  { "Après avoir modifiez votre post tapez ENTRÉE" }
          ReactBootstrap::FormGroup() do
            ReactBootstrap::FormControl(
            placeholder: "Modifiez votre post puis ENTRÉE",
            value: params.post.body,
            type: :text,
            ).on(:change) do |e|
              params.post.body = e.target.value # as the user types update the body
            end.on(:key_down) do |e|
              if e.key_code == 13
                params.post.save
                params.on_save
              end
            end
          end
        end
      end

    end
  end
end
