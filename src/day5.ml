open Base
open Stdio

let to_bin = function
  | 'F' | 'L' -> '0'
  | 'B' | 'R' -> '1'
  | _ -> assert false

let day5_1 seats =
  match List.max_elt seats ~compare:Int.compare with
  | Some max -> max
  | _ -> assert false

let day5_2 seats =
  let valid_seats = Set.Poly.of_list (List.range 46 992)
  and filled_seats = Set.Poly.of_list seats in
  Set.diff valid_seats filled_seats

let seat_id line = Int.of_string ("0b" ^ String.map line ~f:to_bin)

let () =
  let input = In_channel.input_lines In_channel.stdin
  and output = printf "%d\n" in
  let seats = List.map input ~f:seat_id in
  day5_1 seats |> output;
  day5_2 seats |> Set.iter ~f:output
