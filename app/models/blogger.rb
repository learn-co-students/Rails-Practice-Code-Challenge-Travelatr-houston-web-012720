class Blogger < ApplicationRecord
has_many :posts
has_many :destinations, through: :posts

validates :name , uniqueness: true, on: :create
validates :age, numericality: { greater_than: 0 }

    def likes
        self.posts.inject(0){|sum, post| sum+= post.likes}
    end
    def featured_post
        self.posts.max_by {|post| post.likes}
    end

    def top_5
        self.destinations.sort { |d1, d2| 
        d2.post_count(self) <=> d1.post_count(self) 
    }.first(5)
    end
end
