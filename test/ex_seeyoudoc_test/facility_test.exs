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
        assert {:ok, %{body: %{"data" => body}}} = ExSeeyoudoc.Facility.about()
        assert body["facility"]["id"] == "5ad14cc2-b74e-48f6-a3a6-5597f2a1261d"
      end
    end
  end

  describe "insurances/1" do
    test "will return the insurances data and checks the first entry structure" do
      use_cassette "valid_insurances" do
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
                 ExSeeyoudoc.Facility.insurances()

        assert %{
                 "avatar" => "/uploads/e63b4270-45d6-4f5d-a3ca-b5cb6ccfd03c.jpg?v=63872266588",
                 "description" => "tet",
                 "id" => "7a79bbfa-ddf9-48ba-8bbd-47b5893e073d",
                 "inserted_at" => "2024-01-12T08:16:29.000000Z",
                 "link" => "tet",
                 "name" => "Hmo"
               } = first_entry

        assert layout == false
        assert page_number == 1
        assert page_size == 10
        assert total_entries == 1
        assert total_pages == 1
      end
    end
  end

  describe "events/1" do
    test "will return the events data and checks the first entry structure" do
      use_cassette "valid_events" do
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
                 ExSeeyoudoc.Facility.events()

        assert %{
                 "active" => true,
                 "banner" => "/uploads/6834c34e-162d-4634-ae2e-d01c535cc84f.jpg?v=63875862645",
                 "description" =>
                   "Metro Antipolo Hospital and Medical Center, Inc. (MAHMCI) came to being as a result of a series of brainstorming among professionals,",
                 "end_date" => "2024-02-23",
                 "featured" => true,
                 "id" => "34aada64-9abe-4dc2-823d-620cd9979fde",
                 "inserted_at" => "2024-02-22T23:10:45.000000Z",
                 "short_description" =>
                   "Metro Antipolo Hospital and Medical Center, Inc. (MAHMCI) came to being as a result of a series of brainstorming among professionals,",
                 "slug" => "come-and-be-part-of-our-mahmci-family",
                 "start_date" => "2024-02-22",
                 "title" => "Come and be part of our MAHMCI Family",
                 "updated_at" => "2024-02-23T03:01:07.000000Z"
               } = first_entry

        assert layout == false
        assert page_number == 1
        assert page_size == 10
        assert total_entries == 1
        assert total_pages == 1
      end
    end

    test "will return the event data by slug" do
      use_cassette "valid_get_event" do
        slug = "come-and-be-part-of-our-mahmci-family"

        assert {:ok, %{body: %{"data" => %{"event" => event}}}} =
                 ExSeeyoudoc.Facility.get_events(slug)

        assert %{
                 "active" => true,
                 "banner" => "/uploads/6834c34e-162d-4634-ae2e-d01c535cc84f.jpg?v=63875862645",
                 "description" =>
                   "Metro Antipolo Hospital and Medical Center, Inc. (MAHMCI) came to being as a result of a series of brainstorming among professionals,",
                 "end_date" => "2024-02-23",
                 "featured" => true,
                 "id" => "34aada64-9abe-4dc2-823d-620cd9979fde",
                 "inserted_at" => "2024-02-22T23:10:45.000000Z",
                 "short_description" =>
                   "Metro Antipolo Hospital and Medical Center, Inc. (MAHMCI) came to being as a result of a series of brainstorming among professionals,",
                 "slug" => "come-and-be-part-of-our-mahmci-family",
                 "start_date" => "2024-02-22",
                 "title" => "Come and be part of our MAHMCI Family",
                 "updated_at" => "2024-02-23T03:01:07.000000Z"
               } = event
      end
    end
  end

  describe "rooms/1" do
    test "will return the rooms data and checks the first entry structure" do
      use_cassette "valid_rooms" do
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
                 ExSeeyoudoc.Facility.rooms()

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
        slug = "presidential-suite"

        assert {:ok, %{body: %{"data" => %{"room" => room}}}} =
                 ExSeeyoudoc.Facility.get_rooms(slug)

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
                 ExSeeyoudoc.Facility.careers()

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
        slug = "nurses"

        assert {:ok, %{body: %{"data" => %{"career" => career}}}} =
                 ExSeeyoudoc.Facility.get_careers(slug)

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
                 ExSeeyoudoc.Facility.services()

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
        slug = "44c2be63-46c2-4365-bc5a-8522ee573d61"

        assert {:ok, %{body: %{"data" => %{"service" => service}}}} =
                 ExSeeyoudoc.Facility.get_services(slug)

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
                 ExSeeyoudoc.Facility.promos()

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
        slug = "thank-you-donors-for-our-mahmci-frontliners1"

        assert {:ok, %{body: %{"data" => %{"promo" => promo}}}} =
                 ExSeeyoudoc.Facility.get_promos(slug)

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
    test "will return the doctors data and checks the first entry structure" do
      use_cassette "valid_doctors" do
        assert {:ok,
                %{
                  body: %{
                    "data" => %{
                      "doctors" => [first_entry | _]
                    }
                  }
                }} =
                 ExSeeyoudoc.Facility.doctors()

        assert %{
                 "avatar" =>
                   "/uploads/facility_avatars/d126b21d-bf88-45aa-9ac4-ff9319d136b1.jpg?v=63872765385",
                 "description" => "test",
                 "facility_id" => "5ad14cc2-b74e-48f6-a3a6-5597f2a1261d",
                 "id" => "cfee09fd-8348-42cb-91ed-3682ace933aa",
                 "name" => "Dr Suko",
                 "practitioner" => nil,
                 "slug" => "dr-suko",
                 "specialty" => "Pediatrics",
                 "title" => "Fire Lord"
               } = first_entry
      end
    end

    test "returns the specific doctor data by search name and verifies the first entry details" do
      use_cassette "valid_search_doctor" do
        query_params = %{
          q: "Dr. Olga"
        }

        assert {:ok,
                %{
                  body: %{
                    "data" => %{
                      "doctors" => [first_entry | _]
                    }
                  }
                }} =
                 ExSeeyoudoc.Facility.doctors(query_params)

        assert %{
                 "avatar" => "",
                 "description" =>
                   "Dr. Olga Santiago is a highly skilled and experienced cardiologist serving the community of Metro Antipolo. With a compassionate approach to patient care and a commitment to excellence, Dr. Santiago provides comprehensive cardiovascular services to her patients.",
                 "facility_id" => "5ad14cc2-b74e-48f6-a3a6-5597f2a1261d",
                 "id" => "c9a4e54c-6d9b-49a1-af80-7595c946226f",
                 "name" => "Dr. Olga Santiago",
                 "practitioner" => %{
                   "id" => "5493c1f4-252a-404c-846a-6d65520c02ef",
                   "name" => "Dr. Olga",
                   "room_no" => nil,
                   "schedules" => [
                     %{
                       "days_of_week" => ["thu", "fri"],
                       "end_time" => "15:00:00",
                       "start_time" => "08:00:00",
                       "timeslot_cutoff" => 4,
                       "timeslot_duration" => 30,
                       "timezone" => "Asia/Manila"
                     }
                   ],
                   "title" => "M.D, CCS"
                 },
                 "slug" => "dr-olga-santiago",
                 "specialty" => "Cardio",
                 "title" => "Cardiologist"
               } = first_entry
      end
    end

    test "returns the specific doctor data by slug" do
      use_cassette "valid_get_doctor" do
        slug = "dr-olga-santiago"

        assert {:ok, %{body: %{"data" => %{"doctor" => doctor}}}} =
                 ExSeeyoudoc.Facility.get_doctors(slug)

        assert %{
                 "avatar" => "",
                 "description" =>
                   "Dr. Olga Santiago is a highly skilled and experienced cardiologist serving the community of Metro Antipolo. With a compassionate approach to patient care and a commitment to excellence, Dr. Santiago provides comprehensive cardiovascular services to her patients.",
                 "id" => "c9a4e54c-6d9b-49a1-af80-7595c946226f",
                 "name" => "Dr. Olga Santiago",
                 "practitioner_role" => %{
                   "clinic" => "TB Clinic at BHU Moonwalk",
                   "clinic_is_open" => nil,
                   "clinic_slug" => "tb-clinic-at-bhu-moonwalk",
                   "id" => "5493c1f4-252a-404c-846a-6d65520c02ef",
                   "name" => "Dr. Olga",
                   "room_no" => nil,
                   "schedules" => [
                     %{
                       "days_of_week" => ["thu", "fri"],
                       "end_time" => "15:00:00",
                       "start_time" => "08:00:00",
                       "timeslot_cutoff" => 4,
                       "timeslot_duration" => 30,
                       "timezone" => "Asia/Manila"
                     }
                   ],
                   "slug" => "dr-olga",
                   "title" => "M.D, CCS"
                 }
               } = doctor
      end
    end
  end

  describe "departments/1" do
    test "will return the departments data and checks the first entry structure" do
      use_cassette "valid_departments" do
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
                 ExSeeyoudoc.Facility.departments()

        assert %{
                 "banner" => "/uploads/48bd2304-350b-4ffb-beb7-e07735cb424f.jpeg?v=63876220428",
                 "clinic_active" => nil,
                 "clinic_id" => nil,
                 "clinic_name" => nil,
                 "clinic_published" => nil,
                 "clinic_slug" => nil,
                 "contact_no" => "(02) 123 4567",
                 "description" =>
                   "The Cardiology Department provides comprehensive care for heart-related ailments.",
                 "id" => "69e930c0-7046-433e-8086-6a6143c847d4",
                 "inserted_at" => "2024-02-27T02:33:48.000000Z",
                 "local_no" => "1234",
                 "name" => "Cardiology",
                 "room_no" => "10A",
                 "slug" => "cardiology",
                 "updated_at" => "2024-02-27T02:33:48.000000Z"
               } = first_entry

        assert layout == false
        assert page_number == 1
        assert page_size == 10
        assert total_entries == 1
        assert total_pages == 1
      end
    end

    test "returns the specific departments data by slug" do
      use_cassette "valid_get_department" do
        slug = "cardiology"

        assert {:ok, %{body: %{"data" => %{"department" => department}}}} =
                 ExSeeyoudoc.Facility.get_department(slug)

        assert %{
                 "banner" => "/uploads/48bd2304-350b-4ffb-beb7-e07735cb424f.jpeg?v=63876220428",
                 "clinic_active" => nil,
                 "clinic_id" => nil,
                 "clinic_name" => nil,
                 "clinic_published" => nil,
                 "clinic_slug" => nil,
                 "contact_no" => "(02) 123 4567",
                 "description" =>
                   "The Cardiology Department provides comprehensive care for heart-related ailments.",
                 "id" => "69e930c0-7046-433e-8086-6a6143c847d4",
                 "inserted_at" => "2024-02-27T02:33:48.000000Z",
                 "local_no" => "1234",
                 "name" => "Cardiology",
                 "room_no" => "10A",
                 "slug" => "cardiology",
                 "updated_at" => "2024-02-27T02:33:48.000000Z"
               } = department
      end
    end

    test "returns the specific department doctors data by department id" do
      use_cassette "valid_department_doctors" do
        department_id = "69e930c0-7046-433e-8086-6a6143c847d4"

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
                 ExSeeyoudoc.Facility.department_doctors(department_id)

        assert %{
                 "avatar" => "",
                 "description" =>
                   "Dr. Olga Santiago is a highly skilled and experienced cardiologist serving the community of Metro Antipolo. With a compassionate approach to patient care and a commitment to excellence, Dr. Santiago provides comprehensive cardiovascular services to her patients.",
                 "id" => "c9a4e54c-6d9b-49a1-af80-7595c946226f",
                 "name" => "Dr. Olga Santiago",
                 "practitioner_role" => %{
                   "clinic" => "TB Clinic at BHU Moonwalk",
                   "clinic_is_open" => nil,
                   "clinic_slug" => "tb-clinic-at-bhu-moonwalk",
                   "id" => "5493c1f4-252a-404c-846a-6d65520c02ef",
                   "name" => "Dr. Olga",
                   "room_no" => nil,
                   "schedules" => [
                     %{
                       "days_of_week" => ["thu", "fri"],
                       "end_time" => "15:00:00",
                       "start_time" => "08:00:00",
                       "timeslot_cutoff" => 4,
                       "timeslot_duration" => 30,
                       "timezone" => "Asia/Manila"
                     }
                   ],
                   "slug" => "dr-olga",
                   "title" => "M.D, CCS"
                 },
                 "slug" => "dr-olga-santiago",
                 "specialty" => "Cardio",
                 "title" => "Cardiologist"
               } = first_entry

        assert layout == false
        assert page_number == 1
        assert page_size == 10
        assert total_entries == 1
        assert total_pages == 1
      end
    end
  end
end
