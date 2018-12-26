defmodule WaveWeb.Auth.Guardian do
  use Guardian, otp_app: :wave

  def subject_for_token(resource, _claims) do
    sub = to_string(resource.id)

    {:ok, sub}
  end

  def resource_from_claim(claims) do
    id = claims["sub"]
    resource = Wave.Accounts.get_user!(id)

    {:ok, resource}
  end
end
