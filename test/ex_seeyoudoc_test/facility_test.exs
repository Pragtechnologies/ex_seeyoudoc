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
          api_key: "YqCA/SFksMdDaXJqeCJVXYNfddg="
        }

        assert {:ok, %{body: %{"data" => body}}} = ExSeeyoudoc.Facility.about(headers)
        assert body["facility"]["id"] == "5ad14cc2-b74e-48f6-a3a6-5597f2a1261d"
      end
    end
  end

  # describe "insurances/1" do
  #   test "will return the insurances data" do
  #     use_cassette "valid_insurances" do
  #       headers = %{
  #         api_key: "YqCA/SFksMdDaXJqeCJVXYNfddg="
  #       }

  #       assert {:ok, %{body: %{"data" => body}}} =
  #                ExSeeyoudoc.Facility.insurances(headers)

  #       assert body["facility"]["id"] == "5ad14cc2-b74e-48f6-a3a6-5597f2a1261d"
  #     end
  #   end
  # end

  describe "rooms/1" do
    test "will return the rooms data" do
      use_cassette "valid_rooms" do
        headers = %{
          api_key: "YqCA/SFksMdDaXJqeCJVXYNfddg="
        }

        assert {:ok, %{body: %{"data" => body}}} =
                 ExSeeyoudoc.Facility.rooms(headers)

        assert %{
                 "data" => %{
                   "entries" => [
                     %{
                       "banner" =>
                         "/uploads/9c603e7c-7ee2-4dda-9f73-65f87cc665b3.jpeg?v=63873386135",
                       "description" =>
                         "Designed to give a luxurious feel, the Presidential Suite at MAHMC has a fully air conditioned single patient room, visitor’s room and lounge.",
                       "featured" => true,
                       "id" => "75f1ba86-711c-4ce3-9215-ceb371db1ff6",
                       "inserted_at" => "2024-01-12T06:00:37.000000Z",
                       "name" => "Presidential Suite",
                       "photos" => [
                         "/uploads/room_photos/7768892c-cd41-422a-b84a-70e38bba33f8.jpg",
                         "/uploads/room_photos/820dc2c8-46f2-4c93-b27f-ea7480878c37.jpg",
                         "/uploads/room_photos/be865d12-2cc9-446e-91ce-4bf2585e9961.jpg"
                       ],
                       "short_description" =>
                         "Designed to give a luxurious feel, the Presidential Suite at MAHMC has a fully air conditioned single patient room, visitor’s room and lounge. ",
                       "slug" => "presidential-suite",
                       "updated_at" => "2024-01-25T07:17:06.000000Z"
                     }
                   ],
                   "layout" => false,
                   "page_number" => 1,
                   "page_size" => 10,
                   "total_entries" => 1,
                   "total_pages" => 1
                 }
               } = body
      end
    end

    test "will return the room data for a given slug" do
      use_cassette "valid_get_room" do
        headers = %{
          api_key: "YqCA/SFksMdDaXJqeCJVXYNfddg="
        }

        slug = "presidential-suite"

        assert {:ok, %{body: %{"data" => body}}} =
                 ExSeeyoudoc.Facility.get_rooms(headers, slug)

        assert %{
                 "room" => %{
                   "banner" => "/uploads/9c603e7c-7ee2-4dda-9f73-65f87cc665b3.jpeg?v=63873386135",
                   "description" =>
                     "Designed to give a luxurious feel, the Presidential Suite at MAHMC has a fully air conditioned single patient room, visitor’s room and lounge.",
                   "featured" => true,
                   "id" => "75f1ba86-711c-4ce3-9215-ceb371db1ff6",
                   "inserted_at" => "2024-01-12T06:00:37.000000Z",
                   "name" => "Presidential Suite",
                   "photos" => [
                     "/uploads/room_photos/7768892c-cd41-422a-b84a-70e38bba33f8.jpg",
                     "/uploads/room_photos/820dc2c8-46f2-4c93-b27f-ea7480878c37.jpg",
                     "/uploads/room_photos/be865d12-2cc9-446e-91ce-4bf2585e9961.jpg"
                   ],
                   "short_description" =>
                     "Designed to give a luxurious feel, the Presidential Suite at MAHMC has a fully air conditioned single patient room, visitor’s room and lounge. ",
                   "slug" => "presidential-suite",
                   "updated_at" => "2024-01-25T07:17:06.000000Z"
                 }
               } = body
      end
    end
  end

  describe "careers/1" do
    test "will return the careers data" do
      use_cassette "valid_careers" do
        headers = %{
          api_key: "YqCA/SFksMdDaXJqeCJVXYNfddg="
        }

        assert {:ok, %{body: %{"data" => body}}} =
                 ExSeeyoudoc.Facility.careers(headers)

        assert %{
                 "entries" => [
                   %{
                     "active" => true,
                     "banner" => "",
                     "description" =>
                       "Metro Antipolo Hospital and Medical Center is hiring NURSES! 💙 Come and join our team!",
                     "end_datetime" => "2024-02-21T15:27:00Z",
                     "featured" => true,
                     "id" => "d920579e-4ef4-4cb5-9c5f-63fc5b150250",
                     "inserted_at" => "2024-02-20T07:27:56.000000Z",
                     "short_description" =>
                       "Metro Antipolo Hospital and Medical Center is hiring NURSES! 💙 Come and join our team!",
                     "slug" => "nurses",
                     "start_datetime" => "2024-02-20T15:27:00Z",
                     "title" => "NURSES",
                     "updated_at" => "2024-02-20T07:27:56.000000Z"
                   }
                 ],
                 "layout" => false,
                 "page_number" => 1,
                 "page_size" => 10,
                 "total_entries" => 1,
                 "total_pages" => 1
               } = body
      end
    end

    test "will return the careers data for a given slug" do
      use_cassette "valid_get_career" do
        headers = %{
          api_key: "YqCA/SFksMdDaXJqeCJVXYNfddg="
        }

        slug = "nurses"

        assert {:ok, %{body: %{"data" => body}}} =
                 ExSeeyoudoc.Facility.get_careers(headers, slug)

        assert %{
                 "career" => %{
                   "active" => true,
                   "banner" => "",
                   "description" =>
                     "Metro Antipolo Hospital and Medical Center is hiring NURSES! 💙 Come and join our team!",
                   "end_datetime" => "2024-02-21T15:27:00Z",
                   "featured" => true,
                   "id" => "d920579e-4ef4-4cb5-9c5f-63fc5b150250",
                   "inserted_at" => "2024-02-20T07:27:56.000000Z",
                   "short_description" =>
                     "Metro Antipolo Hospital and Medical Center is hiring NURSES! 💙 Come and join our team!",
                   "slug" => "nurses",
                   "start_datetime" => "2024-02-20T15:27:00Z",
                   "title" => "NURSES",
                   "updated_at" => "2024-02-20T07:27:56.000000Z"
                 }
               } = body
      end
    end
  end

  describe "services/1" do
    test "will return the services data" do
      use_cassette "valid_services" do
        headers = %{
          api_key: "YqCA/SFksMdDaXJqeCJVXYNfddg="
        }

        assert {:ok, %{body: %{"data" => body}}} =
                 ExSeeyoudoc.Facility.services(headers)

        assert %{
                 "entries" => [
                   %{
                     "description" =>
                       "Twenty-four hour Holter monitoring is a continuous test to record your heart's rate and rhythm for 24 hours.",
                     "id" => "44c2be63-46c2-4365-bc5a-8522ee573d61",
                     "method" => "virtual",
                     "name" => "24-Hour Holter Monitoring"
                   }
                 ],
                 "layout" => false,
                 "page_number" => 1,
                 "page_size" => 10,
                 "total_entries" => 1,
                 "total_pages" => 1
               } = body
      end
    end

    test "will return the services data for a given slug" do
      use_cassette "valid_get_services" do
        headers = %{
          api_key: "YqCA/SFksMdDaXJqeCJVXYNfddg="
        }

        slug = "44c2be63-46c2-4365-bc5a-8522ee573d61"

        assert {:ok, %{body: %{"data" => body}}} =
                 ExSeeyoudoc.Facility.get_services(headers, slug)

        assert %{
                 "service" => %{
                   "doctors" => [],
                   "service" => %{
                     "description" =>
                       "Twenty-four hour Holter monitoring is a continuous test to record your heart's rate and rhythm for 24 hours.",
                     "id" => "44c2be63-46c2-4365-bc5a-8522ee573d61",
                     "method" => "virtual",
                     "name" => "24-Hour Holter Monitoring"
                   }
                 }
               } = body
      end
    end
  end
end
