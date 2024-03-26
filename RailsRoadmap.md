### https://guides.rubyonrails.org/getting_started.html

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
class Create<Entidades> < ActiveRecord::Migration[7.1]
def change
  create_table :<entidades> do |t|
    t.string :title, uniqueness: true
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
          CREATE TABLE <entidade> (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username VARCHAR(50) NOT NULL UNIQUE,
            email VARCHAR(12) NOT NULL UNIQUE,
            password_digest VARCHAR(255) NOT NULL,
            created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
            updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
          );
        SQL
    end

    def down
    execute <<-SQL
        DROP TABLE IF EXISTS <entidades>;
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

`/config/routes.rb`
```
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

`/models/[<entidade>].rb`
```
class <Entidade> < ApplicationRecord
    validates :<attribute>, presence: true
end
```

### Cria rotas automaticamente

`/config/routes.rb`
```
    resources :entidades, only: [:show, :new, :create, :edit, :update, :destroy]
```
OBS: Algumas rotas é necessário criar uma rota específica pra renderizar a ação, Exemplo: Para New e Update pois precisa-se receber dados por formulário dedicado.

`<verb> "/path/", to: "controllers#ação(def)", as: <ação_entidades_path>`
```
get "/<entidades>", to: "<entidades>#acao", as: "acao_entidades_path"
```
`Caso houver conflitos com outras rotas é possível especificar qual html.erb o rails irá renderizar`
```
get "/<entidades>"/acao, to: "<entidades>#acao", as: "acao_entidades_path"
```

### Renderiza pagina para cadastrar novas entidades

```
get "/<entidades>/new", to: "<entidades>#new"
```

### Ação para cadastrar novas entidades em banco

```
post "/<entidades>/", to: "<entidades>#create"
```

`/controllers/[<entidades>_controller.rb]`
```
class <Entidades>Controller < ApplicationController
    def index
        @<entidade> = <Entidade>.all
    end

    def new
        @<entidade> = <Entidade>.new
    end

    def create
        @<entidade> = <Entidade>.new(<entidade>_params)
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
    <a href="/<entidades>">Texto</a>
    </li>
</ul>
```

### Criar link para à rota de criação de nova entidade


`/views/[<entidade>]/[index.html.erb]`
```
<h2>Test rota entidade</h2>
<a href="/<entidades>/new">Texto</a>
```

### Renderiza formulário ao chamar rota /<entidades>/new

`/views/[<entidades>]/[new.html.erb]`
```
    <h1>Texto nova <entidade></h1>

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

`/views/[<entidades>]/[show.html.erb]`
```
<h1><%= @<entidade>.<atributo> %></h1>
<%= link_to "Voltar para a lista de <entidades>", <entidades>_path %>
```

### Adiciona ação para show

`/controllers/[<entidades>_controller.rb]`
```
def show
    @<entidade> = <Entidade>.find(params[:id])
end
```

### Adiciona ação para destroy

`/controllers/[<entidades>_controller.rb]`
```
def destroy
    @<entidade> = <Entidade>.find(params[:id])
    @<entidade>.destroy
    redirect_to <entidades>_path, notice: "<Entidade> foi destruída!"
end
```

### Adiciona botões no ui

`views/<entidades>/index.html.erb`
```
<% @<entidades>.each do |<entidade>| %>
    <br>
    <div>
        <strong>ID:</strong> <%= <entidade>.id %>

        <span style="display: inline-block;"> 
            <%= link_to <entidade>_path(<entidade>) do %>
                <button type="button">Texto</button>
            <% end %>
        </span>
        <span style="display: inline-block;"> 
            <%= form_with(url: <entidade>_path(<entidade>), method: :delete, data: { confirm: "Tem certeza que deseja excluir esta tarefa?" }) do |form| %>
                <%= form.submit "Texto" %>
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
get "/<entidades>/:id", to: "<entidades>#edit"
```

### Rota pra persistir novos dados editados
### OBS: Mesmo o Rails gerando as rotas automaticamente tem que ter esta rota adicional senão o patch fica sem rota

```
patch "/<entidades>/:id", to: "<entidades>#update", as: "acao_<entidade>"
...
```

### Renderiza [edit.html.rb] para update da <entidade>

`/app/controllers/<entidades>_controller.rb`
```
def edit
    @<entidade> = <Entidade>.find(params[:id])
end
``` 

### Cria ação para update da <entidade> em banco

`/app/controllers/<entidades>_controller.rb`
``` 
def update
    @<entidade> = <Entidade>.find(params[:id])
    if @<entidade>.update(<entidade>_params)
        redirect_to <entidades>_path, notice: "<Entidade> foi atualizada."
    elsif
        redirect_to <entidades>_path, notice: "Não foi possível atualizar a <entidade>!"
    end
end
``` 

### Página a ser renderizada quando a função edit chamar

`views/<entidades>/edit.html.rb`
``` 
<%= form_with(model: @<entidade>, local: true) do |form| %>
    <%= form.label :title %>
    <%= form.text_field :title %>

    <%= form.label :description %>
    <%= form.text_field :description %>

    <br>
    <%= form.submit %>
<% end %>
``` 

# Codificar migração para relações em banco

`./db/migrate/<version-tamanho-14>_<create_<entidade1_entidade2>.rb`
```
class Create<Entidade1_Entidades2> < ActiveRecord::Migration[7.1]
    def up
        execute <<-SQL
            CREATE TABLE <entidade1_entidades2> (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                <entidade1>_id INTEGER NOT NULL,
                <entidade2>_id INTEGER NOT NULL,

                created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                
                FOREIGN KEY (<entidade1>_id) REFERENCES <entidade1>(id),
                FOREIGN KEY (<entidade2>_id) REFERENCES <entidade2>(id)
            );
        SQL
    end

    def down
        execute <<-SQL
            DROP TABLE IF EXISTS <entidade1_entidades2>;
        SQL
    end
end
```

# Modelar relações entre entidades

`./app/models/<entidade1>.rb`
```
class <entidade1> < ApplicationRecord
  has_many :<entidades2>, dependent: :destroy
end
```
`./app/models/<entidade2>.rb`
```
class <Entidade2> < ApplicationRecord
  belongs_to :<entidade1>
end
```

### Desbrickar schema.rb caso fique travado em atributos created_at: nil, updated_at: nil

```
rails generate migration Create<Entidade> <nomeColuna:string> <nomeColuna:string>
```

### Se pode definir as rotas automaticamente:

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
