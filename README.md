# 7graus
Teste de automação - 7graus

O teste foi criado utilizando as seguintes ferramentas:
- ruby 2.7.0p0 (2019-12-25 revision 647ee6f091) [x86_64-darwin18]
- Rails 6.0.3.4
- Selenium Webdriver
- Capybara/rspec

Passos para instalação:
- Ruby on rails https://rubyinstaller.org/downloads/
- Selenium Webdriver https://www.selenium.dev/documentation/en/selenium_installation/installing_webdriver_binaries/
- Driver do selenium para Chrome https://chromedriver.chromium.org/downloads

Configuração Capybara:
- Gerar nova aplicação Rails: rails new test_app -T
- Abrir o Gemfile da nova aplicação e insira o código:
group :development, :test do
  gem 'rspec-rails', '3.8'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end
- Ainda no Gemfile, adicione:
group :test do
  gem 'capybara', '~> 3.8'
end
- Rodar no console: bundle install
- Ainda no console: rails generate rspec:install
- Para rodar o teste gerado vá para a pasta raiz do projeto e execute: rspec

Importante: Ajustar login e senha para logar na Amazon, os campos estão em branco no código:
find(:id, "ap_email").send_keys "e-mail cadastrado"
find(:id, "ap_password").send_keys "senha de acesso"

Ambiente utilizado:
- Sistema Operacional: MacOS Mojave Versão 10.14.6
- Navegador utilizado: Chrome Versão 86.0.4240.80
- Editor código fonte: Visual Studio Code versão 1.51.1

O ficheiro gerado com o código fonte está na pasta: spec/features/amazon_spec.rb

OBS: Se o teste não executar corretamente nas primeiras execuções, peço que rode novamente, pois o tempo de espera para carregamento dos componentes, que é automático da ferramenta, está causando essa instabilidade. Estou aprimorando os testes para resolver esta questão, tão logo resolvido, atualizo o código.


