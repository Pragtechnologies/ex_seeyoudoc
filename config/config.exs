import Config

config :ex_seeyoudoc,
  base_url: "http://localhost:4100/api",
  api_key: "PAfAF084V3ilJJRgGf8DjQ/D8g0="

import_config "#{config_env()}.exs"
