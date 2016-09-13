module Components
  module Home
    class UsersPosts < React::Component::Base

      # param :post, type: Post
      # param param_with_default: "default value"
      # param :param_with_default2, default: "default value" # alternative syntax
      # param :param_with_type, type: Hash
      # param :array_of_hashes, type: [Hash]
      # collect_all_other_params_as :attributes  #collects all other params into a hash

      # The following are the most common lifecycle call backs,
      # the following are the most common lifecycle call backs# delete any that you are not using.
      # call backs may also reference an instance method i.e. before_mount :my_method

      before_mount do
        @users = User.all
      end

      def render
        div do
          h4{"Ils ont postés :"}
          p{"Un peu de texte qui sert a rien pour le moment"}
          @users.each do |user|
            p{"#{user.email} : #{user.posts.count}"}
          end
        end
      end

    end
  end
end
