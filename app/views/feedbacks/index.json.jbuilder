json.array!(@feedbacks) do |feedback|
  json.extract! feedback, :id, :response, :musing_id, :muser_id, :time
  json.url feedback_url(feedback, format: :json)
end
