# frozen_string_literal: true

json.messages(@messages) do |message|
  json.call(
    message,
    :id,
    :french_content,
    :piou_content,
    :user_id,
    :tag_id,
    :created_at,
    :updated_at
  )
end
