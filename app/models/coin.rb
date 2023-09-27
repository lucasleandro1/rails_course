class Coin < ApplicationRecord
    belongs_to :mining_type #associação para chave estrangeira
end
