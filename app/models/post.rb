class Post < ActiveRecord::Base 
    validates :title, presence: true 
    validates :content, length: { minimum: 250 } 
   validates :summary, length: {maximum: 250} 
#    validates :category, acceptance: true, message: "Non-Fiction" 
#    validates :category, acceptance: true, message "Fiction"
    validates :category, inclusion: {in: ["Non-Fiction", "Fiction"]} 
    validate :clickbait
    def clickbait 
        if [/Won't Believe/i, /Secret/i, /Top [0-9]/i, /Guess/i].none? {|pattern| pattern.match(title)} 
            self.errors[:title] << "Oh must be clickbait" 
        end 

    end 
end
