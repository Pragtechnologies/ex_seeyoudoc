defmodule ExSeeyoudoc.Facility do
  @moduledoc """
    API for facility
  """

  def about() do
    "/facility/about"
    |> ExSeeyoudoc.get(%{})
  end

  def insurances(params \\ %{}) do
    query_params = URI.encode_query(params)

    "/facility/insurances?#{query_params}"
    |> ExSeeyoudoc.get(%{})
  end

  def rooms(params \\ %{}) do
    query_params = URI.encode_query(params)

    "/facility/rooms?#{query_params}"
    |> ExSeeyoudoc.get(%{})
  end

  def get_rooms(slug) do
    "/facility/rooms/#{slug}"
    |> ExSeeyoudoc.get(%{})
  end

  def careers(params \\ %{}) do
    query_params = URI.encode_query(params)

    "/facility/careers?#{query_params}"
    |> ExSeeyoudoc.get(%{})
  end

  def get_careers(slug) do
    "/facility/careers/#{slug}"
    |> ExSeeyoudoc.get(%{})
  end

  def services(params \\ %{}) do
    query_params = URI.encode_query(params)

    "/facility/services?#{query_params}"
    |> ExSeeyoudoc.get(%{})
  end

  def get_services(slug) do
    "/facility/services/#{slug}"
    |> ExSeeyoudoc.get(%{})
  end

  def promos(params \\ %{}) do
    query_params = URI.encode_query(params)

    "/facility/promos?#{query_params}"
    |> ExSeeyoudoc.get(%{})
  end

  def get_promos(slug) do
    "/facility/promos/#{slug}"
    |> ExSeeyoudoc.get(%{})
  end

  def events(params \\ %{}) do
    query_params = URI.encode_query(params)

    "/facility/events?#{query_params}"
    |> ExSeeyoudoc.get(%{})
  end

  def get_events(slug) do
    "/facility/events/#{slug}"
    |> ExSeeyoudoc.get(%{})
  end

  def doctors(params \\ %{}) do
    query_params = URI.encode_query(params)

    "/facility/doctors?#{query_params}"
    |> ExSeeyoudoc.get(%{})
  end

  def get_doctors(slug) do
    "/facility/doctors/#{slug}"
    |> ExSeeyoudoc.get(%{})
  end

  def departments(params \\ %{}) do
    query_params = URI.encode_query(params)

    "/facility/departments?#{query_params}"
    |> ExSeeyoudoc.get(%{})
  end

  def get_department(slug) do
    "/facility/departments/#{slug}"
    |> ExSeeyoudoc.get(%{})
  end

  def department_doctors(department_id, params \\ %{}) do
    query_params = URI.encode_query(params)

    "/facility/department-doctors/#{department_id}?#{query_params}"
    |> ExSeeyoudoc.get(%{})
  end

  def departments_v2(params \\ %{}) do
    query_params = URI.encode_query(params)

    "/facility/departments_v2?#{query_params}"
    |> ExSeeyoudoc.get(%{})
  end

  def get_department_v2(slug) do
    "/facility/departments_v2/#{slug}"
    |> ExSeeyoudoc.get(%{})
  end
end
