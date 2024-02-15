defmodule ExSeeyoudoc do
  @moduledoc """
  Elixir API wrapper for SeeYouDoc www.seeyoudoc.com
  """

  @doc """
  Returns the status of the SeeYouDoc API
  """
  def status do
    "/status"
    |> get()
  end

  @doc false
  def get(url, params \\ nil) do
    url = parse_url(url, params)

    init()
    |> auth()
    |> Req.get(url: url)
  end

  def get(url, params, headers) do
    url = parse_url(url, params)

    init()
    |> auth()
    |> parse_headers(headers)
    |> Req.get(url: url)
  end

  defp parse_headers(request, headers) do
    request
    |> api_key(headers)
  end

  defp api_key(req, %{api_key: api_key}) do
    req
    |> Req.Request.put_headers([
      {"api-key", api_key}
    ])
  end

  defp parse_url(url, nil), do: url
  defp parse_url(url, params), do: url <> "?" <> URI.encode_query(params)

  defp init do
    base_url = Application.get_env(:ex_seeyoudoc, :base_url)
    Req.new(base_url: base_url)
  end

  defp auth(req) do
    key = Application.get_env(:ex_seeyoudoc, :api_key)

    req
    |> Req.Request.put_headers([
      {"Content-Type", "application/json"},
      {"api-key", "#{key}"}
    ])
  end
end
