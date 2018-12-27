defmodule WaveWeb.Schema.AccountsTypes do
  use Absinthe.Schema.Notation

  # Token return via guardian auth

  object :user_session do
    field(:token, non_null(:string))
  end

  # provider

  enum :provider do
    value(:facebook)
  end
end
