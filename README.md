ActiveAdminFriendlyId
=====================

Attempt to use FriendlyId on the front end and not on the ActiveAdmin backend

### In order to use FriendlyId with Active Admin

In order to use FriendlyId for the front end app and id for the backend ActiveAdmin modify your controller like so:

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
