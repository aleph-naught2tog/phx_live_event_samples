defmodule PhxLiveEventSamplesWeb.BasicLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L{
      <section>
        <button phx-click="click">
          Working button
        </button>
        <hr />
        <label for="input_target_id">
          This input will error in the JS console on keydown:
        </label>
        <input
          type="text"
          id="input_target_id"
          name="input_target"
          phx-keydown="keydown"
        />
        <hr />
        <label for="input_target_id">
          This input will simply never fail and never fire on keydown:
        </label>
        <input
          type="text"
          id="input_target_id"
          name="input_target"
          phx-keydown="keydown"
          phx-target="document"
        />
      </section>
    }
  end
end