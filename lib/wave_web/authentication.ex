defmodule WaveWeb.Authentication do
  alias WaveWeb.Oauth
  alias Wave.Accounts

  def login(token, "facebook") do
    attrs = Oauth.Facebook.get_info(token)

    # does user exist?
    search_params = %{
      facebook_id: attrs.facebook_id,
      email: attrs.email
    }

    Accounts.get_user_or_create(attrs, search_params)
  end

  #   def login(token, "google") do
  #   end
  #   def login(token, "twitter") do
  #   end
end
