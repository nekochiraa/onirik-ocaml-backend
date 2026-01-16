(* src/main.ml *)
open Dream

let () =
  run
  @@ logger
  @@ router [

    (* GET /ping → juste pour tester le serveur *)
    get "/ping" (fun _ ->
      json {| { "status": "ok" } |}
    );

    (* POST /hello → on reçoit du texte en body *)
    post "/hello" (fun request ->
      let%lwt body = body request in
      json (Printf.sprintf {| { "message": "Bonjour %s" } |} body)
    );
  ]
