defmodule DemoWeb.LightLive do
    use DemoWeb, :live_view
    alias Demo.Agent
    alias Demo.Convertor

    def mount(_params, _session, socket) do
        {:ok, assign(socket, :currencies, Agent.init() |> Enum.map(fn {k, v} -> k end))}
    end

    def render(assigns) do
        ~L"""
            <h1><%= for i<- @currencies, do: i %></h1>
            <button phx-click="change">change</button>
        """
    end

    def handle_event("change", _value, socket) do
        {:noreply, assign(socket, :currencies, Agent.modify(["teste"]))}
    end
end