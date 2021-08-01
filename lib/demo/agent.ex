defmodule Demo.Agent do
    def start_link do
        Agent.start_link(fn -> [] end, name: __MODULE__)
    end

    def add(list) do
        Agent.update(__MODULE__, fn(_state) -> list end)
    end

    def get() do
        Agent.get(__MODULE__, fn state -> state end)
    end

    def init() do
        case start_link() do
            {:ok, _pid} -> add(Demo.Convertor.user_repos()) 
            {:error, _} -> %{"error" => "error"}
        end
        get()
    end

    def modify(list) do
        _value = add(list)
        get()
    end
end