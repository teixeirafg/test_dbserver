module Pages
  class Home < SitePrism::Page
    # set_url '/teste'

    elements :product, '.replace-2x.img-responsive'
    element  :modal, '#product'
    element  :add_cart, '#add_to_cart'
  end
end
