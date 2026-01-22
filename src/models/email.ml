module Email : sig
  type t = private string

  type error =
    |Empty
    |Missing_at
    |Contains_space
  val create : string -> (t, error ) result
end = struct
  type t = string 
  type error = Empty | Missing_at | Contains_space
  let create (s:string) : (t , error) result = 
    if s = "" then Error Empty
    else if not (String.contains s '@') then Error Missing_at
    else if (String.contains s ' ') then Error Contains_space
    else
      Ok (s : t)  

end
