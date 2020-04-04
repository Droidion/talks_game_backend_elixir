defmodule TalksGameWeb.Schema do
  use Absinthe.Schema
  import_types(TalksGameWeb.Schema.ContentTypes)

  alias TalksGameWeb.Resolvers

  query do
    @desc "Sign in"
    field :signin, :session do
      arg(:login, non_null(:string))
      arg(:password, non_null(:string))
      resolve(&Resolvers.Content.signin/3)
    end

    @desc "Sign out"
    field :signout, :message do
      arg(:token, non_null(:string))
      resolve(&Resolvers.Content.signout/3)
    end

    @desc "Timers"
    field :timers, list_of(:timer) do
      arg(:token, non_null(:string))
      resolve(&Resolvers.Content.timers/3)
    end
  end
end
