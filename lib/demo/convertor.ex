defmodule Demo.Convertor do
    alias Demo.Agent

    @url_crypto System.get_env("url_crypto")

    @api_key System.get_env("api_key")
    @headers ["X-CoinAPI-Key": @api_key, "Accept": "Application/json; Charset=utf-8"]

   
    def user_repos() do
        {:ok, response} = HTTPoison.get(@url_crypto, @headers)
        response.body 
        |> Poison.decode! 
        |> Enum.map(fn item -> [item["asset_id"], item["price_usd"] ] end)
        |> Enum.into(%{}, fn [a,b] -> {a, b} end)
    end
    
    def get_converted_value(currency, value_from\\"BRL", value_to\\"USD", amount\\1) do
        amount * (currency[value_to]/currency[value_from])
    end
end