module Password : sig
  type t = private string

  type error =
    | Too_short

  val create : string -> (t, error) result
end = struct
  type t = string
  type error = Too_short

  let create (s : string) : (t, error) result =
    if String.length s < 8 then Error Too_short
    else Ok (s : t)
end
