module Commons
  def print_screen(nome_arquivo, resultado)
    path = "report/screenshtots/test_#{resultado}"
    photo = "#{path}/#{nome_arquivo}.png"
    page.save_screenshot(photo)
    embed(photo, 'image/png', 'clique aqui')
  end
end
