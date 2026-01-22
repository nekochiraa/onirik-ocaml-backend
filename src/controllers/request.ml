  let register request = 
    let%lwt body = Dream.body request in
    match user_input_of_json (Yojson.Safe.from_string body) with
      | Error msg -> 
        Dream.json ~status: `Bad_Request (`String msg)
      |Ok input -> 
        match User_service.register_user input with
          |Ok _ -> 
              Dream.json ~status:`Created (`String "User created")
          |Error e -> 
              Dream.json ~status:`Bad_Request (`String "Invalid user")
