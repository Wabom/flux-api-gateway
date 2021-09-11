# Up database

  * `docker run --name flux_api_gateway_dev -e POSTGRES_PASSWORD=postgres -e POSTGRES_DB=flux_api_gateway_dev -it -p5432:5432 -d postgres`

  * `docker exec -it flux_api_gateway_dev bash`

  * `su - postgres`

  * `psql -d flux_api_gateway_dev -U postgres`

# FluxApiGateway

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
