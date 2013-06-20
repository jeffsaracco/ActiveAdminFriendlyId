ActiveAdmin.register Post do
  controller do
    around_filter do |controller, action|
      Post.class_eval do
        def to_param
          id.to_s
        end
      end

      begin
        action.call
      ensure
        Post.class_eval do
          def to_param
            slug
          end
        end
      end
    end
  end
end
