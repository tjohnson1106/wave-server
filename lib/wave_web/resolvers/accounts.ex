defmodule WaveWeb.Resolvers.Accounts do
  alias WaveWeb.{Authentication, Auth}

  # current implementation is facebook provider open conditionally to other login options 

  def login(_, %{token: token, provider: provider}, _) do
    case provider do
      :facebook ->
        {:ok, user} = Authentication.login(token, "facebook")

        {:ok, token, _} = Auth.Guardian.encode_and_sign(user)

        # this token is returned from Guardian
        {:ok, %{token: token}}
    end
  end
end
