module Name : sig
  type t = private string

  type error =
    | Empty
    | Too_short
    | Invalid_chars

  val create : string -> (t, error) result
end = struct
  type t = string
  type error = Empty | Too_short | Invalid_chars

  let is_alphanumeric c =
    (c >= 'a' && c <= 'z')
    || (c >= 'A' && c <= 'Z')
    || (c >= '0' && c <= '9')

  let create (s : string) : (t, error) result =
    if s = "" then Error Empty
    else if String.length s < 3 then Error Too_short
    else if not (String.for_all is_alphanumeric s) then Error Invalid_chars
    else Ok (s : t)
end
