# PhxLiveEventSamples

* `mix phx.new phx_live_event_samples --no-ecto`
    * `PhxLiveEventSamplesWeb`
    * `PhxLiveEventSamples`

## setup

1. update dependencies
    * `mix deps.get`
    * `mix deps.compile`
    * `npm --prefix assets install`

2. signing salt
    * `mix phx.gen.secret 32`
    * add that signing salt to `config/config.exs`

3. add `live_render` imports into `view` base
4. add each side of the socket
    * add server-side socket endpoint to your `endpoint`
    * add client-side socket to your `app.js`

5. make a folder called `live` parallel to your other web folders -- i.e., same level as `controllers`, etc

6. (optional) add live view `.ex` files to what should cause a reload

## adding an event handler

0. start your server: `mix phx.server`
1. `index.html.eex` => `<%= live_render(@conn, PhxLiveEventSamplesWeb.BasicLive) %>`
    * error: `function PhxLiveEventSamplesWeb.BasicLive.mount/2 is undefined (module PhxLiveEventSamplesWeb.BasicLive is not available)`

2. create a file in `live` called: `basic_live.ex` (`PhxLiveEventSamples.BasicLive`)
    *
    ```elixir
    defmodule PhxLiveEventSamples.BasicLive do
    end
    ```

    * error: `function PhxLiveEventSamplesWeb.BasicLive.mount/2 is undefined or private`

3. `use` the base `LiveView` module to get default functions

    * `use Phoenix.LiveView`
    * error: `function PhxLiveEventSamplesWeb.BasicLive.render/1 is undefined or private`
