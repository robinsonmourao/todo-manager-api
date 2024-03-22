https://youtu.be/eCMHCghmcZc?list=PLEdPHGYbHhldWUFs2Q-jSzXAv3NXh4wu0&t=755

# Criar novo projeto

```
rails new <nome do projeto>
```

# Gerar e migrar tabelas
## AUTOMATICAMENTE:

```
rails generate scaffold NomeDoModelo <atributo1>:tipo <atributo2>:tipo
```
```
rails db:migrate
```

## MANUALMENTE:

`Criar uma pasta em db chamada migrate`
```
Criar um arquivo em db/migrate <time-stamp-tamanho-14>_create-<nome-tabela>.rb
```

### MÉTODO1:

```
    class CreateTasks < ActiveRecord::Migration[7.1]
    def change
      create_table :tasks do |t|
        t.string :title
        t.text :description
        end
      end
    end
```

### MÉTODO2:

```
    class Create<Entidades> < ActiveRecord::Migration[7.1]
        def up
            execute <<-SQL
              CREATE TABLE users (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                username VARCHAR(255) NOT NULL,
                email VARCHAR(255) NOT NULL,
                password_digest VARCHAR(255) NOT NULL,
                created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
              );
            SQL
        end

        def down
        execute <<-SQL
            DROP TABLE IF EXISTS users;
        SQL
        end
    end
```

### PS:

`Executar função 'up'`
```
rails db:migrate
```
`Desfazer última execução 'up'`
```
rails db:rollback
```

### OPTIONAL:

`Para dar desfazer em uma tabela em especifico`
```
rails db:migrate:down VERSION=<time-stamp-tamanho-14>
```
`Se o schema.rb não for preenchido automaticamente`
 ``
rails db:schema:dump
```

# Perna completa de home/index onde Home é pego automaticamente de seu controller e index é o def(método) dentro de controller
## PS: É necessário ter ao menos 1 root, seja ele home ou outra entidade.

```
/config/routes.rb
<!-- root to: "controller#ação(def) -->
root to: "home#index"

/controllers/[home_controller.rb]
class HomeController < ApplicationController
    def index
    end    
end

/views/[home]/[index.html.erb]
<h2>Test rota home</h2>

/views/layouts/application.html.erb
<ul>
    <li>
    <a href="/">Home</a>
    </li>
</ul>
```

## Perna completa para entidades/index     
### Criar modelo da entidade

```
/models/[<entidade>].rb
class Task < ApplicationRecord
    validates :title, presence: true
end
```

### Cria rotas automaticamente para new, create e destroy

`/config/routes.rb`
```
    resources :task, only: [:new, :create, :show, :destroy]
```
OBS: Algumas rotas é necessário criar uma rota específica pra renderizar a ação, Exemplo: Para New e Update pois precisa-se receber dados por formulário dedicado.


`<verbo>, to: "controller#ação(def)`
```
get "/<entidades>", to: "<entidade>#index"
```

### Renderiza pagina para cadastrar novas entidades

```
get"/<entidades>/new", to: "<entidade>#new"
```

### Ação para cadastrar novas entidades em banco

```
post "/<entidades>/", to: "<entidade>#create"
```

`/controllers/[<entidade>_controller.rb]`
```
class <Entidade>Controller < ApplicationController
    def index
        @tasks = Task.all
    end

    def new
        @<entidade> = <Entidade>.new
    end

    def create
        @<entidade> = <Entidade>.new(task_params)
        if @<entidade>.save
            redirect_to <entidades>_path, notice: "<Entidade> foi criada!"
        else
            render :new
        end
    end

    
    private

    def <entidade>_params
        params.require(:<entidade>).permit(:<atributo1>, :<atributoN>)
    end
end
```

### Criar link para rota no html principal

`/views/layouts/application.html.erb`
```
...
<ul>
    <li>
    <a href="/<entidade>">"<entidade>"</a>
    </li>
</ul>
```

### Criar link para à rota de criação de nova entidade


`/views/[<entidade>]/[index.html.erb]`
```
<h2>Test rota entidade</h2>
<a href="/<entidades>/new">Criar nova <entidade></a>
```

### Renderiza formulário ao chamar rota /<entidades>/new

`/views/[<entidade>]/[new.html.erb]`
```
    <h1>Nova <entidade></h1>

    <%= form_with(model: @<entidade>, url: <entidades>_path) do |form| %>
        <div>
            <%= form.label :<atributo1> %>
            <%= form.text_field :<atributo1> %>
        </div>
        <div>
            <%= form.label :<atributoN> %>
            <%= form.text_field :<atributoN> %>
        </div>
        <%= form.submit "Criar <entidade>" %>
    <% end %>
```

### Renderiza uma entidade em especifico

`/views/[<entidade>]/[show.html.erb]`
```
<h1><%= @<entidade>.<atributo> %></h1>
<%= link_to "Voltar para a lista de <entidades>", tasks_path %>
```

### Adiciona ação para show

`/controllers/[<entidade>.rb]`
```
def show
    @task = Task.find(params[:id])
end
```

### Adiciona ação para destroy

`/controllers/[<entidade>.rb]`
```    
def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: "Task foi destruída!"
end
```

### Adiciona botões no ui

`views/task/index.html.erb`
```
<% @tasks.each do |task| %>
    <br>
    <div>
        <strong>ID:</strong> <%= task.id %>
        <strong>Titulo:</strong> <%= task.title %>

        <span style="display: inline-block;"> 
            <%= link_to task_path(task) do %>
                <button type="button">Mais detalhes da tarefa</button>
            <% end %>
        </span>
        <span style="display: inline-block;"> 
            <%= form_with(url: task_path(task), method: :delete, data: { confirm: "Tem certeza que deseja excluir esta tarefa?" }) do |form| %>
                <%= form.submit "Excluir tarefa" %>
            <% end %>
        </span>
        
    </div>
<% end %>
```

### Adiciona ação para editar entidades

`/config/routes.rb`
    
### Rota específica para renderizar o formulário da edição

`...`
```
get "/<entidade>/:id", to: "<entidade>#edit"
```

### Rota pra persistir novos dados editados
### OBS: Mesmo o Rails gerando as rotas automaticamente tem que ter esta rota adicional senão o patch fica sem rota

```
patch "/<entidade>/:id", to: "<entidade>#update", as: "<entidade>"
...
```

### Renderiza [edit.html.rb] para update da <entidade>

`/app/controllers/<entidade>_controller.rb`
```
def edit
    @<entidade> = <Entidade>.find(params[:id])
end
``` 

### Cria ação para update da <entidade> em banco

`/app/controllers/<entidade>_controller.rb`
``` 
def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
        redirect_to task_path, notice: "Task foi atualizada."
    elsif
        redirect_to task_path, notice: "Não foi possível atualizar a task!"
    end
end
``` 

### Página a ser renderizada quando a função edit chamar

`views/<entidade>/edit.html.rb`
``` 
<%= form_with(model: @task, local: true) do |form| %>
    <%= form.label :title %>
    <%= form.text_field :title %>

    <%= form.label :description %>
    <%= form.text_field :description %>

    <br>
    <%= form.submit %>
<% end %>
``` 

### Desbrickar schema.rb caso fique travado em atributos created_at: nil, updated_at: nil

`''      ''        ''                ''               <nomeColuna:string> <nomeColuna:string>`
```
rails generate migration AddTitleAndDirectorToMovies title:string director:string
```

# Se pode definir as rotas automaticamente:

``` 
resources :<entidades>, only: [:index, :show, :new, :create, :edit, :update, :destroy]
``` 

# Ou manualmente:

``` 
# get "Rota", to: "controller#def"
get "/sobre", to: "sobre#index"
get "/movies", to: "movies#index"
get "/movie/new", to: "movies#create"
get "/movie/:id/update", to: "movies#update"
```