require 'rails_helper'

RSpec.describe User, type: :model do

  context "Testando a View User" do
    users = User.all
    size_old = users.size

    it "Cadastrando um usuario" do
    visit '/users/new'
    within("#new_user") do
      fill_in 'Name', with: 'Jackson'
      fill_in 'Email', with: 'teste@teste.com'
    end
    click_button 'Create User'
    expect(page).to have_content 'Cadastrado com sucesso!'

    expect(users.size).to eql(size_old + 1)
    end
  end  

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

