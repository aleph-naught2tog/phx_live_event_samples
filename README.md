# PhxLiveEventSamples

## quick notes

* The filenames/module names in here assume your project folder is called `phx_live_event_samples`. Because of how Phoenix creates a new project, that project name gives you certain assumed folder/module names. I'm listing them here so that if you want, you can run find/replace over this file. [todo: include a nice little elixir script thing.]
    * `phx_live_event_samples`
    * `phx_live_event_samples_web`
    * `PhxLiveEventSamplesWeb`
    * `PhxLiveEventSamples`

## setup

0. Create a new mix project. `mix phx.new phx_live_event_samples --no-ecto`

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

## adding a very-not-interesting-live module

0. start your server: `mix phx.server`
1. Replace the contents of `index.html.eex` with

    ```elixir
    <%= live_render(@conn, PhxLiveEventSamplesWeb.BasicLive) %>
    ```

    * error: `function PhxLiveEventSamplesWeb.BasicLive.mount/2 is undefined (module PhxLiveEventSamplesWeb.BasicLive is not available)`

2. create a file in `live` called: `basic_live.ex` (`PhxLiveEventSamplesWeb.BasicLive`)
    *
    ```elixir
    defmodule PhxLiveEventSamples.BasicLive do
    end
    ```

    * error: `function PhxLiveEventSamplesWeb.BasicLive.mount/2 is undefined or private`

3. `use` the base `LiveView` module to get default functions

    * `use Phoenix.LiveView`
    * error: `function PhxLiveEventSamplesWeb.BasicLive.render/1 is undefined or private`

4. define the `render/1` function

    ```elixir
    defmodule PhxLiveEventSamplesWeb.BasicLive do
      use Phoenix.LiveView

      def render(assigns) do

      end
    end
    ```

    * error: `expected PhxLiveEventSamplesWeb.BasicLive.render/1 to return a %Phoenix.LiveView.Rendered{} struct`. Phoenix tells us the solution very happily: `Ensure your render function uses ~L...`

5. Add a basic `Phoenix.LiveView.Rendered` value for our `render/1` to return. This makes a basic input element. Please make sure you aren't skipping the label, and that the `for` attribute of the `label` element matches the **`id`** of the input element related to it. This is _extremely_ important for accessibility concerns like screenreaders, etc. &mdash; it's easy and makes a huge difference in someone's ability to use your app.

    ```elixir
    def render(assigns) do
      ~L{
        <section>
          <label for="input_target_id">
            (Currently useless) input:
          </label>
          <input type="text" id="input_target_id" name="input_target" />
        </section>
      }
    end
    ```