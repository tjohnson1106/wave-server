defmodule WaveWeb.Schema.Middleware.Authorize do
  @behaviour Absinthe.Middleware

  # resolution -> returned context
  def call(resolution) do
    with %{current_user: current_user} <- resolution.context do
      resolution
    else
      _ ->
        resolution
        |> Absinthe.Resolution.put_result({:error, "Unauthorized"})
    end
  end
end
