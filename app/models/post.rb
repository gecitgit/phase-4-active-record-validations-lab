class Post < ApplicationRecord

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }

    validate :must_include_clickbait

    CLICKBAIT_OPTIONS = [
        /Won't Believe/i,
        /Secret/i,
        /Top \d/i,
        /Guess/i
    ]

    def must_include_clickbait
        if CLICKBAIT_OPTIONS.none? { |opt| opt.match title }
            errors.add(:title, "NOT DOING ENOUGH")
        end
    end
    




end
