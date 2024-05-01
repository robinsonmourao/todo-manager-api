# ToDo Manager

---

# Descrição
### O ToDo Manager é uma aplicação web simples para gerenciamento de tarefas (todo list) com autenticação de usuário. Ele permite que os usuários criem, visualizem, atualizem e excluam suas próprias tarefas de forma segura e eficiente.

# Status de desenvolvimento

| Tarefa             | Status        | Progresso                         |
|--------------------|--------------|---------------------------------------|
| `Desenvolvimento da API`    | CONCLUÍDO     | -              |
| `Testes unitários`          | CANCELADO     | -              |
| `Testes E2E(Ponta a ponta)` | PROGRESSO     | PAUSADO        |
| `Documentação readme.md`    | PROGRESSO     | PAUSADO        |
| `Casos de uso`              | PROGRESSO     | PAUSADO        |
| `Fluxo de eventos`          | PENDENTE      | -              |
| `Fluxos alternativos`       | PENDENTE      | -              |
| `Fluxos de exceção`         | PENDENTE      | -              |
| `Containerização  `         | PENDENTE      | -              |
| `Hospedagem`                | PENDENTE      | -              |

# Estrutura de arquivos

## Estrutura base

- **.vscode** -> Contém arquivos de configurações da IDE Visual Studio Code
  - `settings.json` -> Configuração da IDE Visual Studio Code

- **assets** -> Contém imagens, sintaxe JavaScript e estilos CSS
  - `images` -> Contém imagens
    - `backgrounds` -> Contém imagens de fundo
      - `home-background.png` -> Imagem de fundo da tela root(signup/login)
      - `site-background.png` -> Imagem de fundo do site
    - `demo-signup` -> Imagem de demonstração da tela 'signup'
    - `demo-tasks` -> Imagem de demonstração da tela 'tasks'
    - `logo` -> Imagem da logo do Todo-manager-api
    - `signup-login-left-side` -> Imagem do lado esquerdo das telas 'signup' e 'login'
  - `javascripts` -> Contém sintaxe JavaScript
    - `script.js` -> Arquivo de sintaxe JavaScript
  - `stylesheets` -> Contém estilos CSS
    - `custom_styles.css` -> Arquivo de estilos CSS

- **controllers** -> Contém controladores do modelo MV[C]
  - `application_controller.rb` -> Controlador principal da aplicação
  - `home_controller.rb` -> Controlador de home (OBSOLETO)
  - `sessions_controller.rb` -> Controlador de sessões
  - `tasks_controller.rb` -> Controlador de tarefas
  - `users_controller.rb` -> Controlador de usuários

- **helpers** -> Contém módulos utilizados para recursividade
  - `logger_helper.rb` -> Módulo para simplificar print() de debug

- **javascript** -> Contém arquivos de imports via JavaScript
  - `controllers` -> Contém arquivos controladores de imports via JavaScript
    - `application.js` -> import do 'rails-ujs' para redirecionamento correto do 'link_to'

- **models** -> Contém modelos do modelo [M]VC
  - `application_record.rb` -> modelo principal do Rails
  - `session.rb` -> modelo de sessão
  - `task.rb` -> modelo de tarefa
  - `user.rb` -> modelo de usuário

- **views** -> Contém 
- **** -> Contém 
- **** -> Contém 
- **db**
  - `migrate`
    - `<000000000000XX_create_<nome-tabela>>` -> Scripts SQL
    - `...`
  - `schema.rb` -> Esquema completo de migração <br>

### Telas
## root/signup
![root/signup](https://raw.githubusercontent.com/robinsonmourao/todo-manager-api/main/app/assets/images/demo-signup.png)
### Tasks cadastradas
![Tasks cadastradas](https://raw.githubusercontent.com/robinsonmourao/todo-manager-api/main/app/assets/images/demo-tasks.png)
---

# Funcionalidades
## Autenticação de Usuário:
- Os usuários podem se cadastrar e fazer login na aplicação usando um endereço de e-mail e senha.
- A autenticação é gerenciada por sessões, permitindo que os usuários permaneçam autenticados enquanto navegam pela aplicação.

## Gerenciamento de Tarefas:
- Cada usuário cadastrado pode criar, visualizar, atualizar e excluir suas próprias tarefas.
- Cada tarefa possui um título e uma descrição, permitindo uma organização eficiente das atividades.

## Associação de Usuários e Tarefas:
- Cada tarefa é associada a um usuário específico, garantindo que cada usuário só possa acessar suas próprias tarefas.
- Isso garante a privacidade e segurança das informações de cada usuário.

---

# Tecnologias Utilizadas
- Ruby on Rails: Framework web para desenvolvimento rápido de aplicativos.
- HTML, CSS e JavaScript: Linguagens de marcação e estilo para a interface do usuário.
- SQLite: Banco de dados relacional para armazenamento de dados.

---

## 🛠 Tech Stack

To make this project run you will need to have the following items installed: 

* Ruby 3.1.4p223
* Rails 7.1.3.2
* SQLite 3.22.0
* Rspec 3.13

## :rocket: Get ready

### Clone the repository:

```
git clone https://github.com/robinsonmourao/todo-manager-api.git
```
### Execute the commands of Ruby programming language installer:
```
Download the following file:
`https://cache.ruby-lang.org/pub/ruby/3.1/ruby-3.1.4.tar.gz`
`tar -xzvf ./Downloads/ruby-3.1.4.tar.gz`
`cd ./Downloads/ruby-3.1.4`
`./configure`
`make`
`sudo make install`
`ruby -v`
```
### Install Rails
```
sudo gem install rails
```

### Install libyaml-dev to avoid bundler compilation problems
```
sudo apt-get install libyaml-dev
```

### Install Bundler
```
sudo gem install bundler
```

### Execute the following comands:

```
bundle install
```
```
rails db:migrate
```
```
rails db:seed
```
### Execute command to install SQLite

```
sudo apt-get install sqlite3
```

## :arrow_forward: Running

### Change directory to where you have cloned OxeanFlix project

> cd /your-root-directory/.../your-project-folder-name-here <br>

### Execute start rails application command:

```
rails s
```

### To access the API, you should get the following address

[http://localhost:3000/](http://localhost:3000/)

## Create your user

Insert `Username`, `Email` and `Password` then login with the same `Email` and `Password`.

## :gear: Running tests

### How about Database?

Well, you can access the SQLite3 database just get in root project directory './' then insert this following command:
```
sqlite3 storage/development.sqlite3
```
## :closed_book:Documentation

* Get more information about [Ruby](https://www.ruby-lang.org/en/documentation/)<br>
* Get more information about [Ruby on Rails](https://rubyonrails.org/)<br>
* Get more information about [SQLite3](https://www.sqlite.org/docs.html)<br>

# Autor

<table>
    <td align="center">
	    <a href="https://github.com/robinsonmourao">
		    <img style="border-radius: 50%;" src="https://avatars.githubusercontent.com/u/49078615?s=460&u=1163c04d9f35b577063b3f6550ae520c4dd2f866&v=4" width="100px;" alt=""/>
		    <br/><sub><b>Robinson Mourão</b></sub>
		</a></br>
    </td>
</table>

## :mailbox: Contact us
* Contact us by email [Robinson Mourão](mailto:bob.info.guaratiba@gmail.com)