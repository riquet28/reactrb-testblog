module Components
  module Home
    class CounterPostsComments < React::Component::Base

      param :post, type: Post
      param :comment, type: Comment

      before_mount do
        @posts = Post.all
        @comments = Comment.all
      end

      def render
        div.row do
          div(class: "col-sm-4 border-right") do
            div(class: "description-block") do
              h5.description_header {"#{@posts.count}"}
              .span.description_text {"POSTS"}
            end
          end
          div(class: "col-sm-4 border-right") do
            div(class: "description-block") do
              h5.description_header {"#{@comments.count}"}
              .span.description_text {"COMMENTS"}
            end
          end
          div(class: "col-sm-4 border-right") do
            div(class: "description-block") do
              h5.description_header { "#{total_intervention}" }
              .span.description_text {"TOTAL"}
            end
          end
        end
      end

      def total_intervention
        @posts.count + @comments.count
      end

    end
  end
end
