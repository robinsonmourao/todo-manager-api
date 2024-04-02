# ToDo Manager

---

# Descrição
### O ToDo Manager é uma aplicação web simples para gerenciamento de tarefas (todo list) com autenticação de usuário. Ele permite que os usuários criem, visualizem, atualizem e excluam suas próprias tarefas de forma segura e eficiente.
![Demonstration](https://raw.githubusercontent.com/robinsonmourao/todo-manager-api/main/app/assets/images/demo.png)
---

# Funcionalidades
## Autenticação de Usuário:
- Os usuários podem se cadastrar e fazer login na aplicação usando um endereço de e-mail e senha.
- A autenticação é gerenciada por sessões, permitindo que os usuários permaneçam autenticados enquanto navegam pela aplicação.

## Gerenciamento de Tarefas:
- Cada usuário pode criar, visualizar, atualizar e excluir suas próprias tarefas.
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

# Instalação
1. Clone o repositório: `git clone https://github.com/seu-usuario/todo-manager.git`
2. Instale as dependências: `bundle install`
3. Crie o banco de dados e execute as migrações: `rails db:create && rails db:migrate`
4. Inicie o servidor Rails: `rails server`
5. Acesse a aplicação em seu navegador: `http://localhost:3000`

---

# Contribuição
- Se você encontrar algum problema ou tiver sugestões de melhoria, sinta-se à vontade para abrir uma issue ou enviar um pull request.

---

# ToDo-API



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
`tar -xzvf ruby-3.1.4.tar.gz`
`cd ruby-3.1.4`
`./configure`
`make`
`sudo make install`
`ruby -v`
```
### Install Rails
```
sudo apt-get install -y build-essential
```
```
sudo gem install rails
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

Insert `name`, `Email` and `Password` then login with it

## :gear: Running tests

### Execute RSpec install commands:

On Windows, add this command on ./gemfile:
```
gem 'rspec-rails'
````
or on Linux:
```
echo "gem 'rspec-rails'" >> Gemfile
```
```
gem install rspec
```
```
gem install bundler
```
```
bundle update rspec-rails
```
To run model tests:
```
rspec spec/models
```
To run route tests:
```
rspec spec/routing
```

## How about Database?

Well, you can access the SQLite3 database just get in root project directory './' then insert this following command:
```
sqlite3 storage/development.sqlite3
```
## :closed_book:Documentation

* Get more information about [Ruby](https://www.ruby-lang.org/en/documentation/)<br>
* Get more information about [Ruby on Rails](https://rubyonrails.org/)<br>
* Get more information about [SQLite3](https://www.sqlite.org/docs.html)<br>
* Get more information about [RSpec](https://rspec.info/documentation/)

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
* Contact us by email [Marino Hohenheim](mailto:intmarinoreturn0@gmail.com)