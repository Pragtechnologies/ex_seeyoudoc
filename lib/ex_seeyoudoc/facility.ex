defmodule ExSeeyoudoc.Facility do
  @moduledoc """
    API for facility
  """

  def about(headers) do
    "/facility/about"
    |> ExSeeyoudoc.get(%{}, headers)
  end
end
