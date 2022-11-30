class Airline < ApplicationRecord
    has_many :reviews
    

    before_create :slugify

    def slugify  #taking name of airline and solidify it, then set that as the slug value
        self.slug = name.parameterize # Takes Airlines name and converts it into a URL safe slug then sets it as the slug value
    end

    def avg_score
        reviews.average(:score).round(2).to_f
    end
end
