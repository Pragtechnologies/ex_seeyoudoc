defmodule ExSeeyoudoc.FacilityTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Finch

  setup do
    ExVCR.Config.cassette_library_dir("test/cassettes/facility")
    :ok
  end

  describe "about/1" do
    test "will return the about data" do
      use_cassette "valid_about" do
        headers = %{
          api_key: "FETxtb1aomd+784ZXD7VQULXh6k="
        }

        assert {:ok, %{body: %{"data" => body}}} = ExSeeyoudoc.Facility.about(headers)
        assert body["facility"]["id"] == "12ff4888-fd87-4fc3-b4ae-8878d425e1ac"
      end
    end
  end
end
