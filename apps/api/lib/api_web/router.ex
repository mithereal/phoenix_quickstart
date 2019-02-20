defmodule ApiWeb.Router do
  use ApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :json_api do
    plug :accepts, ["json-api"]
    plug ApiWeb.Plug.Deserialize
  end

  pipeline :spa do
    plug :accepts, ["json", "html"]
  end

  scope "/api", ApiWeb do
    pipe_through :api
  end

  scope "/", ApiWeb do
    pipe_through :spa
    forward "/", Plug.SPA
  end

  scope "/swagger" do
    forward "/", PhoenixSwagger.Plug.SwaggerUI,
      otp_app: :api,
      swagger_file: "swagger.json",
      disable_validator: true
  end
end
