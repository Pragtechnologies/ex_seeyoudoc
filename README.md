# ExSeeyoudoc

[Docs](https://hexdocs.pm/ex_seeyoudoc)

ExSeeyoudoc is an elixir sdk for [SeeYouDoc](https://www.seeyoudoc.com). 

## Installation

Put this in your `mix.exs` and run `mix deps.get`.

```elixir
def deps do
  [
    {:ex_seeyoudoc, "~> 0.1"}
  ]
end
```

## Usage

Before you use, you need to have credentials in SeeYouDoc. Check guide [here](https://www.seeyoudoc.com/developer/api-reference/#authentication).

Once done, add your credentials inside your configs. 

```
config :ex_seeyoudoc,
  base_url: "https://www.seeyoudoc.com/api",
  api_key: "REPLACE WITH YOUR API KEY"
```

## Developers

To contribute to this project:

- Fork this project and clone in your machine
- Copy `config.secret.backup.exs` to `config.secret.exs` then set your credentials
- Look for new updates at [SeeYouDoc API Docs](https://www.seeyoudoc.com/developer/api-reference/)
- Follow code pattern 

Before you submit pull request:

- Run `mix coveralls`. Be sure coverage is at 100%
- Run `mix credo`. Be sure everything is clean.
- Run `mix dialyzer`. Be sure everything is good.

## License 
Copyright (c) 2024 Noel Del Castillo

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at 

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
