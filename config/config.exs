import Config

config :ex_seeyoudoc,
  base_url: "http://localhost:4100/api",
  api_key: ""

import_config "#{config_env()}.exs"
