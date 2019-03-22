# PhxLiveEventSamples

1. update dependencies
    * `mix deps.get`
    * `mix deps.compile`
    * `npm --prefix assets install`

2. signing salt
    * `mix phx.gen.secret 32`
    * add that signing salt to `config/config.exs`