defmodule WaveWeb.Resolvers.Posts do
  def photos(_, _, _) do
    {:ok, Wave.Posts.list_photos()}
  end

  def photo(_, %{id: id}, _) do
    {:ok, Wave.Posts.get_photo!(id)}
  end
end
