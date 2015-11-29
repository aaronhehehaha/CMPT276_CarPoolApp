json.array!(@posts) do |post|
  json.extract! post, :id, :StreetNumber, :StreetName, :Mon, :MonStartTime, :MonEndTime, :Tue, :TueStartTime, :TueEndTime, :Wen, :WenStartTime, :MonEndTime, :Thu, :ThuStartTime, :ThuEndTime, :Fri, :FriStartTime, :FriEndTime, :Content, :user_id
  json.url post_url(post, format: :json)
end
