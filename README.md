# ToDo Manager

---

# Descrição
### O ToDo Manager é uma aplicação web simples para gerenciamento de tarefas (todo list) com autenticação de usuário. Ele permite que os usuários criem, visualizem, atualizem e excluam suas próprias tarefas de forma segura e eficiente.

### Página inicial
![Demonstration0](https://raw.githubusercontent.com/robinsonmourao/todo-manager-api/main/app/assets/images/demo-home.png)
### Tela de cadastro
![Demonstration](https://raw.githubusercontent.com/robinsonmourao/todo-manager-api/main/app/assets/images/demo-signup.png)
### Exemplo de tarefas cadastradas
![Demonstration2](https://raw.githubusercontent.com/robinsonmourao/todo-manager-api/main/app/assets/images/demo-tasks.png)
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