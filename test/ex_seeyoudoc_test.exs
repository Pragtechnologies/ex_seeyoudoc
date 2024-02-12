defmodule ExSeeyoudocTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Finch

  setup do
    ExVCR.Config.cassette_library_dir("test/cassettes")
    :ok
  end

  describe "status/0" do 
    test "will return the status" do 
      use_cassette "valid_status" do
        assert {:ok, %{body: %{"data" => body}}} = ExSeeyoudoc.status()
        assert body["status"] == "running"
      end
    end
  end
end
