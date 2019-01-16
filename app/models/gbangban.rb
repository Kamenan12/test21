class Gbangban < ApplicationRecord
    has_and_belongs_to_many :themes
    has_many :commentaires
end
