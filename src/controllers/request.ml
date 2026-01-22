  let register request = 
    let%lwt body = Dream.body request in
    match Parse_input.user_input_from_json (Yojson.Safe.from_string body) with
      | Error msg -> 
        Dream.json ~status: `Bad_Request (Yojson.Safe.to_string (`String msg))
      |Ok input -> 
        match Services.User_service.register_user input with
          |Ok _ -> 
              Dream.json ~status:`Created (Yojson.Safe.to_string (`String "User created"))
          |Error _ -> 
              Dream.json ~status:`Bad_Request (Yojson.Safe.to_string (`String "Invalid user"))
