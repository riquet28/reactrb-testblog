module Components
  module Home
    class PostEditItem < React::Component::Base

      param :post
      # param :_onCancel, type: Proc, allow_nil: true
      # param :_onSave, type: Proc, allow_nil: true

      def render
        input(value: params.post.body, placeholder: "Modifier votre Post").
        on(:change) do |e|
          params.post.body = e.target.value # as the user types update the body
        end.on(:key_down) do |e|
          if e.key_code == 13
            params.post.save
          end
        end
      end

    end
  end
end
