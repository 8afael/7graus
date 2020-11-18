require 'capybara/rspec'
require 'webdrivers'

feature 'Amazon', type: :feature do

  Capybara.app_host = 'https://www.amazon.com/'
  Capybara.run_server = false
  Capybara.default_driver = :selenium_chrome

  scenario 'Colocar no carrinho' do
    visit '/'
    expect(page.title).to have_content('Amazon.com') #Verifica se está ná pagina correta
    find(:id, "nav-link-accountList").click
    find(:id, "ap_email").send_keys "         "
    find(:xpath, "/html/body/div[1]/div[1]/div[2]/div/div[2]/div/div[1]/form/div/div/div/div[2]/span/span/input").click
    find(:id, "ap_password").send_keys "          "
    find(:id, "signInSubmit").click #Acessa a área do usuário
    
    busca = find(:id, "twotabsearchtextbox").send_keys "presenter 8000" #Preenche a barra de busca
    busca.native.send_keys(:return)

   link = page.find('div.s-desktop-width-max.s-desktop-content.sg-row > div.sg-col-20-of-24.sg-col-28-of-32.sg-col-16-of-20.sg-col.sg-col-32-of-36.sg-col-8-of-12.sg-col-12-of-16.sg-col-24-of-28 > div > span:nth-child(4) > div.s-main-slot.s-result-list.s-search-results.sg-row > div:nth-child(2) > div > span > div > div > div > div > div:nth-child(2) > div.sg-col-4-of-12.sg-col-8-of-16.sg-col-16-of-24.sg-col-12-of-20.sg-col-24-of-32.sg-col.sg-col-28-of-36.sg-col-20-of-28 > div > div:nth-child(1) > div > div > div:nth-child(1) > h2 > a')[:href] 
   visit(link)
     
   find(:id, 'add-to-cart-button').click
   find(:id, 'hlb-ptc-btn-native').click
   find('#address-book-entry-2 > div.ship-to-this-address.a-button.a-button-primary.a-button-span12.a-spacing-medium > span > a').click
   find('#shippingOptionFormId > div:nth-child(6) > div > div > span.sosp-continue-button.a-button.a-button-primary.a-button-span12.a-padding-none.continue-button > span > input').click

   expect(page).to have_content('Select a payment method') #Verifica se está na página de pagamento
  end
end
