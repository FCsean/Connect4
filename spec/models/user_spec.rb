require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#has_equipment' do
    context 'when user has game quipment with the same name and quantity > 0' do
      it 'return true' do
        user = User.new
        ge = GameEquipment.create(name: 'sword', quantity: 2)
        user.game_equipments << ge
        expect(user.has_equipment?('sword')).to eql(true)
      end
    end
    context 'when user has game quipment with the same name and quantity <= 0' do
      it 'returns false' do
        user = User.new
        ge = GameEquipment.create(name: 'sword', quantity: 0)
        user.game_equipments << ge
        expect(user.has_equipment?('sword')).to eql(false)
      end
    end
    context 'when no equipment with the same name' do
      it 'returns false' do
        user = User.new
        ge = GameEquipment.create(name: 'sword', quantity: 2)
        user.game_equipments << ge
        expect(user.has_equipment?('shield')).to eql(false)
      end
    end
  end
end
