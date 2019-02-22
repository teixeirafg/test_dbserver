Dado("escolher um produto na home") do
  visit 'http://automationpractice.com'
end

E(/^busquei por 'shirt'$/) do
  page.find(:css, '#search_query_top').set('shirt')
  page.find(:css, '.button-search').click
end

Quando("seleciono a primeira opção") do
  wait = Selenium::WebDriver::Wait.new(:timeout => 5)
  input = wait.until {
    element = page.find(:css, ".last-mobile-line")
    element if element.visible?
  }
  input.hover
  @element_text_pdp = page.find(:css, '.right-block > h5 > a').text
  page.find(:css, '.ajax_add_to_cart_button').click
  page.find(:css, '.layer_cart_cart.col-xs-12.col-md-6  a').click
end

E("prossigo com esse produto do carrinho para o Checkout") do
  element_text_cart = page.find(:css, '.product-name').text
  expect(element_text_cart).to eql @element_text_pdp
  page.find(:css, '.btn-default.standard-checkout.button-medium').click
end

Entao("eu realizo o cadastro") do
  page.find(:css, '#email_create').send_keys('okasjdajsdo1uh@mailinator.com')
  page.find(:css, '#SubmitCreate').click
  page.find(:css, '#id_gender1').click
  page.find(:css, '#customer_firstname').send_keys ('Teste')
  page.find(:css, '#customer_lastname').send_keys ('Junior')
  page.find(:css, '#passwd').send_keys ('1234qwer')
  page.execute_script("$('#days').val('5')")
  page.execute_script("$('#months').val('3')")
  page.execute_script("$('#years').val('1990')")
  @element_addres_log = page.find(:css, '#address1').send_keys('Baker St').value
  page.find(:css, '#city').send_keys ('Chicago')
  find('#uniform-id_state').click
  find('#id_state option', :text => 'Georgia').click
  page.find(:css, '#postcode').send_keys ('99999')
  page.find(:css, '#phone_mobile').send_keys ('119999999999')
  page.find(:css, '#submitAccount').click
end

E("finalizo a compra com as informações necessárias") do
  element_addres_page = page.find(:css, '#address_delivery .address_address1.address_address2').text
  expect(element_addres_page).to eql @element_addres_log
  page.find(:css, '#center_column > form > p > button').click
  wait = Selenium::WebDriver::Wait.new(:timeout => 5)
  input = wait.until {
    element = page.find(:css, "#uniform-cgv")
    element if element.visible?
  }
  page.find(:css, '#uniform-cgv').click
  page.find(:css, '#form > p > button').click
  wait = Selenium::WebDriver::Wait.new(:timeout => 5)
  input = wait.until {
    element = page.find(:css, "#HOOK_PAYMENT > div:nth-child(1) > div > p > a")
    element if element.visible?
  }
  @element_price =  page.find(:css,'#total_product').text.delete("$").to_f
  element_shippin = page.find(:css, '#total_shipping').text.delete("$").to_f
  element_total_price = page.find(:css, '#total_price_container').text.delete("$").to_f
  expect(element_shippin+@element_price).to eql element_total_price
  page.find(:css, '#HOOK_PAYMENT > div:nth-child(1) > div > p > a').click
  wait = Selenium::WebDriver::Wait.new(:timeout => 5)
  input = wait.until {
    element = page.find(:css, "#cart_navigation > button")
    element if element.visible?
  }
  page.find(:css, '#cart_navigation > button').click
end