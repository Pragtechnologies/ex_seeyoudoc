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

  describe "rooms/1" do
    test "will return the rooms data and checks the first entry structure" do
      use_cassette "valid_rooms" do
        headers = %{
          api_key: "YqCA/SFksMdDaXJqeCJVXYNfddg="
        }

        assert {:ok,
                %{
                  body: %{
                    "data" => %{
                      "entries" => [first_entry | _],
                      "layout" => layout,
                      "page_number" => page_number,
                      "page_size" => page_size,
                      "total_entries" => total_entries,
                      "total_pages" => total_pages
                    }
                  }
                }} =
                 ExSeeyoudoc.Facility.rooms(headers)

        assert %{
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
               } = first_entry

        assert layout == false
        assert page_number == 1
        assert page_size == 10
        assert total_entries == 1
        assert total_pages == 1
      end
    end

    test "will return the room data by slug" do
      use_cassette "valid_get_room" do
        headers = %{
          api_key: "YqCA/SFksMdDaXJqeCJVXYNfddg="
        }

        slug = "presidential-suite"

        assert {:ok, %{body: %{"data" => %{"room" => room}}}} =
                 ExSeeyoudoc.Facility.get_rooms(headers, slug)

        assert %{
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
               } = room
      end
    end
  end

  describe "careers/1" do
    test "will return the career data and checks the first entry structure" do
      use_cassette "valid_careers" do
        headers = %{
          api_key: "YqCA/SFksMdDaXJqeCJVXYNfddg="
        }

        assert {:ok,
                %{
                  body: %{
                    "data" => %{
                      "entries" => [first_entry | _],
                      "layout" => layout,
                      "page_number" => page_number,
                      "page_size" => page_size,
                      "total_entries" => total_entries,
                      "total_pages" => total_pages
                    }
                  }
                }} =
                 ExSeeyoudoc.Facility.careers(headers)

        assert %{
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
               } = first_entry

        assert layout == false
        assert page_number == 1
        assert page_size == 10
        assert total_entries == 1
        assert total_pages == 1
      end
    end

    test "returns the specific career data by slug" do
      use_cassette "valid_get_career" do
        headers = %{
          api_key: "YqCA/SFksMdDaXJqeCJVXYNfddg="
        }

        slug = "nurses"

        assert {:ok, %{body: %{"data" => %{"career" => career}}}} =
                 ExSeeyoudoc.Facility.get_careers(headers, slug)

        assert %{
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
               } = career
      end
    end
  end

  describe "services/1" do
    test "will return the service data and checks the first entry structure" do
      use_cassette "valid_services" do
        headers = %{
          api_key: "YqCA/SFksMdDaXJqeCJVXYNfddg="
        }

        assert {:ok,
                %{
                  body: %{
                    "data" => %{
                      "entries" => [first_entry | _],
                      "layout" => layout,
                      "page_number" => page_number,
                      "page_size" => page_size,
                      "total_entries" => total_entries,
                      "total_pages" => total_pages
                    }
                  }
                }} =
                 ExSeeyoudoc.Facility.services(headers)

        assert %{
                 "description" =>
                   "Twenty-four hour Holter monitoring is a continuous test to record your heart's rate and rhythm for 24 hours.",
                 "id" => "44c2be63-46c2-4365-bc5a-8522ee573d61",
                 "method" => "virtual",
                 "name" => "24-Hour Holter Monitoring"
               } = first_entry

        assert layout == false
        assert page_number == 1
        assert page_size == 10
        assert total_entries == 1
        assert total_pages == 1
      end
    end

    test "returns the specific service data by slug" do
      use_cassette "valid_get_services" do
        headers = %{
          api_key: "YqCA/SFksMdDaXJqeCJVXYNfddg="
        }

        slug = "44c2be63-46c2-4365-bc5a-8522ee573d61"

        assert {:ok, %{body: %{"data" => %{"service" => service}}}} =
                 ExSeeyoudoc.Facility.get_services(headers, slug)

        assert %{
                 "doctors" => [],
                 "service" => %{
                   "description" =>
                     "Twenty-four hour Holter monitoring is a continuous test to record your heart's rate and rhythm for 24 hours.",
                   "id" => "44c2be63-46c2-4365-bc5a-8522ee573d61",
                   "method" => "virtual",
                   "name" => "24-Hour Holter Monitoring"
                 }
               } = service
      end
    end
  end

  describe "promos/1" do
    test "will return the promos data and checks the first entry structure" do
      use_cassette "valid_promos" do
        headers = %{
          api_key: "YqCA/SFksMdDaXJqeCJVXYNfddg="
        }

        assert {:ok,
                %{
                  body: %{
                    "data" => %{
                      "entries" => [first_entry | _],
                      "layout" => layout,
                      "page_number" => page_number,
                      "page_size" => page_size,
                      "total_entries" => total_entries,
                      "total_pages" => total_pages
                    }
                  }
                }} =
                 ExSeeyoudoc.Facility.promos(headers)

        assert %{
                 "active" => true,
                 "banner" => "/uploads/c96d1ba0-01cf-44b3-9534-0f9db8522d60.png?v=63872862812",
                 "description" =>
                   "To all of you who've helped, who continue to support, and who have vowed to pray for our frontliners!\n\nOnce again, Thank you very much 💙",
                 "featured" => true,
                 "id" => "27d93f1b-1a95-4a76-ac38-c43acb5e51e7",
                 "inserted_at" => "2024-01-19T05:53:33.000000Z",
                 "short_description" =>
                   "A huge Thank you to all the donors who shared their blessings to our MAHMCI Frontliners.",
                 "slug" => "thank-you-donors-for-our-mahmci-frontliners1",
                 "title" => "Thank you donors for our MAHMCI Frontliners_1",
                 "updated_at" => "2024-01-19T05:53:33.000000Z"
               } = first_entry

        assert layout == false
        assert page_number == 1
        assert page_size == 10
        assert total_entries == 6
        assert total_pages == 1
      end
    end

    test "returns the specific promo data by slug" do
      use_cassette "valid_get_promos" do
        headers = %{
          api_key: "YqCA/SFksMdDaXJqeCJVXYNfddg="
        }

        slug = "thank-you-donors-for-our-mahmci-frontliners1"

        assert {:ok, %{body: %{"data" => %{"promo" => promo}}}} =
                 ExSeeyoudoc.Facility.get_promos(headers, slug)

        assert %{
                 "active" => true,
                 "banner" => "/uploads/c96d1ba0-01cf-44b3-9534-0f9db8522d60.png?v=63872862812",
                 "description" =>
                   "To all of you who've helped, who continue to support, and who have vowed to pray for our frontliners!\n\nOnce again, Thank you very much 💙",
                 "featured" => true,
                 "id" => "27d93f1b-1a95-4a76-ac38-c43acb5e51e7",
                 "inserted_at" => "2024-01-19T05:53:33.000000Z",
                 "short_description" =>
                   "A huge Thank you to all the donors who shared their blessings to our MAHMCI Frontliners.",
                 "slug" => "thank-you-donors-for-our-mahmci-frontliners1",
                 "title" => "Thank you donors for our MAHMCI Frontliners_1",
                 "updated_at" => "2024-01-19T05:53:33.000000Z"
               } = promo
      end
    end
  end

  describe "doctors/1" do
    test "returns the specific doctor data by slug" do
      use_cassette "valid_doctors" do
        headers = %{
          api_key: "YqCA/SFksMdDaXJqeCJVXYNfddg="
        }

        slug = "dr-suko"

        assert {:ok, %{body: %{"data" => %{"doctor" => doctor}}}} =
                 ExSeeyoudoc.Facility.get_doctors(headers, slug)

        assert %{
                 "avatar" =>
                   "/uploads/facility_avatars/d126b21d-bf88-45aa-9ac4-ff9319d136b1.jpg?v=63872765385",
                 "description" => "test",
                 "id" => "cfee09fd-8348-42cb-91ed-3682ace933aa",
                 "name" => "Dr Suko",
                 "practitioner_role" => nil,
                 "slug" => "dr-suko",
                 "specialty" => "Pediatrics",
                 "title" => "Fire Lord"
               } = doctor
      end
    end
  end
end
