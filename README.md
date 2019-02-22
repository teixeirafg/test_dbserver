# test_dbserver

Funcionalidade: Compra - Checkout+Cadastro

  Cenario: Fluxo de Checkout com cadastro
    Dado escolher um produto na home
    E busquei por 'shirt'
    Quando seleciono a primeira opção
    E prossigo com esse produto do carrinho para o Checkout
    Entao eu realizo o cadastro
    E finalizo a compra com as informações necessárias


Instalar:

Ruby;
Chromedriver e Google Chrome;
gem install capybara;
gem install capybara/cucumber;
gem install site prism;
gem install pry;
gem install rspec
gem install selenium-webdriver;
gem install cucumber;

Para executar o script:

Estar na pasta raiz do projeto;
Executar o comando "cucumber"
