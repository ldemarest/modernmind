json.array!(@neurons) do |neuron|
  json.extract! neuron, :id, :name
  json.url neuron_url(neuron, format: :json)
end
