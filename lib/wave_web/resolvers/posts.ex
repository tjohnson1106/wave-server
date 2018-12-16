defmodule WaveWeb.Resolvers.Posts do
  def photos(_, _, _) do
    {:ok, Wave.Posts.list_photos()}
  end
end
