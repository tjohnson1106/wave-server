defmodule WaveWeb.Schema do
  use Absinthe.Schema

  alias WaveWeb.Resolvers
  alias WaveWeb.Schema.Middleware

  import_types(__MODULE__.PostsTypes)
  import_types(__MODULE__.AccountsTypes)

  query do
    @desc "Get list of photos"
    field :photos, list_of(:photo) do
      middleware(Middleware.Authorize)
      resolve(&Resolvers.Posts.photos/3)
    end

    @desc "Get photo by id"
    field :photo, :photo do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Posts.photo/3)
    end
  end

  mutation do
    @desc "Login as a user"
    field :login, :user_session do
      # token value is not non null because because token is sent to client and may need to use alternative login method(email, Google, etc)

      arg(:token, :string)
      arg(:provider, type: :provider)

      resolve(&Resolvers.Accounts.login/3)
    end
  end
end
