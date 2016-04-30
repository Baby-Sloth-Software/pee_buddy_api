json.success 'true'
json.rating do
  json.rating_id @rating.id
end

# need to return new "icon rating" to display the happy or sad icon or something that the FE can use to modify what user sees
