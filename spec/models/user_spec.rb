require 'rails_helper'

RSpec.describe User, type: :model do
  context "Validade de um usuário" do
    it "usuario válido?" do
        user = User.new
        user.name = "Jackson"
        user.email = "jack@jack.com"
        
        expect(user.valid?).to be_truthy
    end
  end


  context "Validade de um usuário" do
    it "usuario inválido?" do
        user = User.new
        user.name = "Jackson"
        user.email = nil
        
        expect(user.valid?).to be_falsey
    end
  end

  context "Títulos válidos" do
    it "título completo?" do
        user = User.new
        user.name = "Jackson"
        user.email = "jack@jack.com"
        expect(user.titulo_completo).to eql("Sr. Jackson - Email: jack@jack.com")
    end
  end



end

