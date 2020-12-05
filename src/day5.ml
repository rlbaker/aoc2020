open Base
open Stdio

let bit = function
  | 'F' | 'L' -> 0
  | 'B' | 'R' -> 1
  | _ -> assert false

let to_dec = List.foldi ~init:0 ~f:(fun exp acc v -> acc + (v * Int.pow 2 exp))

let seat_id line = String.to_list_rev line |> List.map ~f:bit |> to_dec

let day5_2 seats =
  let seat_range = List.range (Set.min_elt_exn seats) (Set.max_elt_exn seats) in
  let valid_seats = Set.Poly.of_list seat_range in
  Set.diff valid_seats seats

let () =
  let input = In_channel.input_lines In_channel.stdin
  and output = printf "%d\n" in
  let seats = List.map input ~f:seat_id |> Set.Poly.of_list in
  Set.max_elt_exn seats |> output;
  day5_2 seats |> Set.iter ~f:output
