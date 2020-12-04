module PostsHelper
    def uniq_users
        users=@post.comments.collect do |comment|
            comment.user
        end
        users.uniq
    end
end
