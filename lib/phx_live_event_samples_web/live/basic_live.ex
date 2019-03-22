defmodule PhxLiveEventSamplesWeb.BasicLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L{
      <section>
        <button phx-click="click">
          Working button
        </button>
        <label for="input_target_id">
          (Currently useless) input:
        </label>
        <input
          type="text"
          id="input_target_id"
          name="input_target"
          phx-keydown="keydown"
        />
      </section>
    }
  end
end