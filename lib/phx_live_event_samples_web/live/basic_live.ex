defmodule PhxLiveEventSamplesWeb.BasicLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L{
      <section>
        <label for="input_target_id">
          (Currently useless) input:
        </label>
        <input
          type="text"
          id="input_target_id"
          name="input_target"
        />
      </section>
    }
  end
end