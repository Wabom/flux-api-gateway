defmodule FluxApiGatewayWeb.Router do
  use FluxApiGatewayWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug :accepts, ["html"]
  end

  scope "/", FluxApiGatewayWeb do
    pipe_through :api

    # Enables LiveDashboard only for development
    #
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    # if Mix.env() in [:dev, :test] do
    #   import Phoenix.LiveDashboard.Router

    #   pipe_through [:fetch_session, :protect_from_forgery]
    #   live_dashboard "/dashboard", metrics: FluxApiGatewayWeb.Telemetry

    # end

    forward "/", RotingController, :index


  end


end
