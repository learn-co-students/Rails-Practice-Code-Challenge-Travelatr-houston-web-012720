class Destination < ApplicationRecord
has_many :posts
has_many :bloggers, through: :posts

    def average_age
        if self.bloggers.exists?
        self.bloggers.inject(0){|sum, blogger| sum += blogger.age}/self.bloggers.count
        else 
            return 0
        end
    end
    def most_featured
        self.posts.order(:created_at).first
    end

    def post_count(user)
        counter = 0
        self.posts.each do |post| 
            if post.blogger == user
                counter += 1
            end
        end
        counter
    end
end
