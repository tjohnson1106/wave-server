defmodule WaveWeb.Schema do
  use Absinthe.Schema

  alias WaveWeb.Resolvers

  import_types(__MODULE__.PostsTypes)

  query do
    @desc "Get list of photos"
    field :photos, list_of(:photo) do
      resolve(&Resolvers.Posts.photos/3)
    end

    @desc "Get photo by id"
    field :photo, :photo do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Posts.photo/3)
    end
  end
end
