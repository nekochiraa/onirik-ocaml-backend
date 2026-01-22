let user_input_from_json json = 
  match json with 
  | `Assoc fields ->
    (* cette fonction compare parse le json en verifiant que la requete contiennes bien tout les champs necessaire*)
    let email = Yojson.Safe.Util.to_string (List.assoc "email" fields) in
    let name = Yojson.Safe.Util.to_string (List.assoc "name" fields) in
    let password = Yojson.Safe.Util.to_string (List.assoc "password" fields) in 
    Ok { User_input.mail; name; password}
  | _ -> Error "Invalid JSON"
