let register_user input = 
  match User.create input with
  |Ok user -> Ok user
  |Error e -> Error e 
