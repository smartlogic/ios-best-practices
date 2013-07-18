json.array!(@widgets) do |widget|
  json.extract! widget, :name, :description
  json.url widget_url(widget, format: :json)
end
