defmodule ExSeeyoudoc.Facility do
  @moduledoc """
    API for facility
  """

  def about() do
    "/facility/about"
    |> ExSeeyoudoc.get(%{})
  end

  def insurances() do
    "/facility/insurances"
    |> ExSeeyoudoc.get(%{})
  end

  def rooms() do
    "/facility/rooms"
    |> ExSeeyoudoc.get(%{})
  end

  def get_rooms(slug) do
    "/facility/rooms/#{slug}"
    |> ExSeeyoudoc.get(%{})
  end

  def careers() do
    "/facility/careers"
    |> ExSeeyoudoc.get(%{})
  end

  def get_careers(slug) do
    "/facility/careers/#{slug}"
    |> ExSeeyoudoc.get(%{})
  end

  def services() do
    "/facility/services"
    |> ExSeeyoudoc.get(%{})
  end

  def get_services(slug) do
    "/facility/services/#{slug}"
    |> ExSeeyoudoc.get(%{})
  end

  def promos() do
    "/facility/promos"
    |> ExSeeyoudoc.get(%{})
  end

  def get_promos(slug) do
    "/facility/promos/#{slug}"
    |> ExSeeyoudoc.get(%{})
  end

  def events() do
    "/facility/events"
    |> ExSeeyoudoc.get(%{})
  end

  def get_events(slug) do
    "/facility/events/#{slug}"
    |> ExSeeyoudoc.get(%{})
  end

  def get_doctors(slug) do
    "/facility/doctors/#{slug}"
    |> ExSeeyoudoc.get(%{})
  end
end
