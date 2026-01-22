type t = {
  email : Email.t;
  name : Name.t;
  password : Password.t;
}

type error = 
  |Invalid_email of Email.error
  |Invalid_name of Name.error
  |Invalid_password of Password.error

let create (input : User_input.t) : (t, error) result = 
  match Email.create input.email with
  |Error e -> Error (Invalid_email e)
  |Ok email -> 
    match Name.create input.name with
    |Error e -> Error (Invalid_name e)
    | Ok name ->
      match Password.create input.password with
      | Error e -> Error (Invalid_password e)
      |Ok password ->
        Ok { email; name; password}
