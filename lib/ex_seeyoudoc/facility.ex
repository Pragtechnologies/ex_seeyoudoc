defmodule ExSeeyoudoc.Facility do
  @moduledoc """
    API for facility
  """

  def about(headers) do
    "/facility/about"
    |> ExSeeyoudoc.get(%{}, headers)
  end

  # def insurances(headers) do
  #   "/facility/insurances"
  #   |> ExSeeyoudoc.get(%{}, headers)
  # end

  def rooms(headers) do
    "/facility/rooms"
    |> ExSeeyoudoc.get(%{}, headers)
  end

  def get_rooms(headers, slug) do
    "/facility/rooms/#{slug}"
    |> ExSeeyoudoc.get(%{}, headers)
  end

  def careers(headers) do
    "/facility/careers"
    |> ExSeeyoudoc.get(%{}, headers)
  end

  def get_careers(headers, slug) do
    "/facility/careers/#{slug}"
    |> ExSeeyoudoc.get(%{}, headers)
  end

  def services(headers) do
    "/facility/services"
    |> ExSeeyoudoc.get(%{}, headers)
  end

  def get_services(headers, slug) do
    "/facility/services/#{slug}"
    |> ExSeeyoudoc.get(%{}, headers)
  end

  def promos(headers) do
    "/facility/promos"
    |> ExSeeyoudoc.get(%{}, headers)
  end

  def get_promos(headers, slug) do
    "/facility/promos/#{slug}"
    |> ExSeeyoudoc.get(%{}, headers)
  end

  def events(headers) do
    "/facility/events"
    |> ExSeeyoudoc.get(%{}, headers)
  end

  def get_events(headers, slug) do
    "/facility/events/#{slug}"
    |> ExSeeyoudoc.get(%{}, headers)
  end

  def get_doctors(headers, slug) do
    "/facility/doctors/#{slug}"
    |> ExSeeyoudoc.get(%{}, headers)
  end
end
