# ToDo Manager

---

# Descrição
## O ToDo Manager é uma aplicação web simples para gerenciamento de tarefas (todo list) com autenticação de usuário. Ele permite que os usuários criem, visualizem, atualizem e excluam suas próprias tarefas de forma segura e eficiente.
![Demonstration](https://github.com/robinsonmourao/todo-manager-api/assets/images/demo.png)
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

# Autor

<table>
    <td align="center">
	    <a href="https://github.com/robinsonmourao">
		    <img style="border-radius: 50%;" src="https://avatars.githubusercontent.com/u/49078615?s=460&u=1163c04d9f35b577063b3f6550ae520c4dd2f866&v=4" width="100px;" alt=""/>
		    <br/><sub><b>Robinson Mourão</b></sub>
		</a></br>
    </td>
</table>