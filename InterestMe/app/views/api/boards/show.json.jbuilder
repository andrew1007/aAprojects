json.id @board.id
json.name @board.name
json.current_user (@current_user ? @current_user.id : nil)
json.owner @board.user_id == (@current_user ? @current_user.id : nil)
json.author @board.user.username
json.owner_id @current_user.id
