defmodule WaveWeb.Resolvers.Accounts do
  # current implementation is facebook provider open conditionally to other login options 

  def login(_, %{token: token, provider: provider}, _) do
    case provider do
      :facebook ->
        {:ok, user} = WaveWeb.Authentication.login(token, "facebook")
    end
  end
end
