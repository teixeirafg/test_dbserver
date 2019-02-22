#language: pt

@fluxo_compra
Funcionalidade: Compra - Checkout+Cadastro

  Cenario: Fluxo de Checkout com cadastro
    Dado escolher um produto na home
    E busquei por 'shirt'
    Quando seleciono a primeira opção
    E prossigo com esse produto do carrinho para o Checkout
    Entao eu realizo o cadastro
    E finalizo a compra com as informações necessárias