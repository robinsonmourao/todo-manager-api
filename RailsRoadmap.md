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

`(n,n)`
```
class Create<Entidades> < ActiveRecord::Migration[7.1]
    def change
        create_table :<entidades> do |t|
        t.string :username, null:false, unique: true
        t.timestamps
        end
    end
end
```
```
class Create<Entidades2> < ActiveRecord::Migration[7.1]
    def change
        create_table :<entidade2> do |t|
        t.string :title, null:false, unique: true
        t.timestamps
        end
    end
end
```
```
class Create<Entidade-relacao> < ActiveRecord:Migration[7.1]
    def change
        create table :<entidade-relacao> do |t|
        t.integer :<entidade>_id, null:false
        t.integer :<entidade2>_id, null:false
        t.timestamps
        end
    end
end
```

`(1,n)`
```
class Create<Entidades> < ActiveRecord::Migration[7.1]
    def change
        create_table :<entidades> do |t|
        t.string :username, null:false, unique: true
        t.timestamps
        end
    end
end
```
```
class Create<Entidades2> < ActiveRecord::Migration[7.1]
    def change
        create_table :<entidade2> do |t|
        t.string :title, null:false, unique: true
        t.references :<entidade>, null: false, foreign_key: true
        t.timestamps
        end
    end
end
```

### MÉTODO2:

`(n,n)`
```
class Create<Entidades> < ActiveRecord::Migration[7.1]
    def up
        execute <<-SQL
          CREATE TABLE <entidades> (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username VARCHAR(50) NOT NULL UNIQUE,

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
```
class Create<Entidades2> < ActiveRecord::Migration[7.1]
    def up
        execute <<-SQL
            CREATE TABLE <entidades2> (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                title VARCHAR(255) NOT NULL,

                created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
            )
        SQL
        end
    end
    def down
        execute <<-SQL
            DROP TABLE IF EXISTS <entidades2>;
        SQL
    end
```
```
class Create<Entidade_Entidades2> < ActiveRecord::Migration[7.1]
    def up
        execute <<-SQL
            CREATE TABLE <entidade_entidades2> (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                <entidade>_id INTEGER NOT NULL,
                <entidade2>_id INTEGER NOT NULL,

                created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                
                FOREIGN KEY (<entidade>_id) REFERENCES <entidade>(id),
                FOREIGN KEY (<entidade2>_id) REFERENCES <entidade2>(id)
            );
        SQL
    end

    def down
        execute <<-SQL
            DROP TABLE IF EXISTS <entidade_entidades2>;
        SQL
    end
end
```

`(1,n)`
```
class Create<Entidades> < ActiveRecord::Migration[7.1]
    def up
        execute <<-SQL
          CREATE TABLE <entidades> (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username VARCHAR(50) NOT NULL UNIQUE,

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
```
class Create<Entidades2> < ActiveRecord::Migration[7.1]
    def up
        execute <<-SQL
            CREATE TABLE <entidades2> (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                title VARCHAR(255) NOT NULL
                <entidade_id> INTEGER,

                created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

                FOREIGN KEY (<entidade>_id) REFERENCES <entidade>(id)
            )
        SQL
        end
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

`Método 1: form_with`
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

`Método 2: link_to`
```
./bin/importmap pin rails-ujs
```
`cd ./app/views/layout/application.html.erb`
```
<!DOCTYPE html>
<html>
  <head>
    ...
    <%= javascript_include_tag 'script', 'rails-ujs' %>
    <%= javascript_importmap_tags %>
  </head>
```
```
import Rails from 'rails-ujs'
Rails.start()
```
`cd ./app/views/tasks/index.html.erb`
```
...
<%= link_to "Remover", destroy_task_path(task), method: :delete, class: 'postit-delete-button' %>
...
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

# Modelar relações entre entidades

## (n,n)
`./app/models/<entidade>.rb`
```
class <entidade> < ApplicationRecord
  has_many :<entidades2>, through: :user_tasks, dependent: :destroy
  has_many :<entidate-relacao>
end
```
`./app/models/<entidade2>.rb`
```
class <Entidade2> < ApplicationRecord
  belongs_to :<entidade>
  has_many :<entidade-relacao>
  validates :title, presence: true, uniqueness: true
end
```
`./app/models/<entidade-relacao>.rb`
```
    belongs_to :<entidade>
    belongs_to :<entidade2>
```

## (1,n)
`./app/models/<entidade>.rb`
```
class <entidade> < ApplicationRecord
  has_many :<entidades2>, dependent: :destroy
end
```
`./app/models/<entidade2>.rb`
```
class <Entidade2> < ApplicationRecord
  belongs_to :<entidade>
  validates :title, presence: true, uniqueness: { scope: :<entidade>_id }    
end
```
`PS: 'dependent: :destroy' é para ignorar a trava de foreignkey caso tente remover entidades com dependentes`
### Desbrickar schema.rb caso fique travado em atributos created_at: nil, updated_at: nil

```
rails generate migration Create<Entidade> <nomeColuna:string> <nomeColuna:string>
```

### Se pode definir as rotas automaticamente:

``` 
resources :<entidades>, only: [:index, :show, :new, :create, :edit, :update, :destroy]
``` 

### Feedback das açôes realizadas

```
<div class=div-notice>
    <% if flash[:notice] %>
        <div id="notice"><%= flash[:notice] %></div>
    <% end %>
</div>
```

### Apontador geral para current_user

`app/controllers/application_controller.rb`
```
helper_method :current_user
    
private

def current_user
    @user ||= User.find_by(id: session[:user_id]) if session[:user_id]
end
```

# Ou manualmente:

``` 
# get "Rota", to: "controller#def"
get "/sobre", to: "sobre#index"
get "/movies", to: "movies#index"
get "/movie/new", to: "movies#create"
get "/movie/:id/update", to: "movies#update"
```

# Visualizar informações das colunas de tabelas

```
PRAGMA table_info(<nome-tabela>);
```

# variaveis instanciadas com '@'

`São variaveis de instancia, e so sao validas enquanto seu metodo pai está em execução`