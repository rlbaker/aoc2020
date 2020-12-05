open Base
open Stdio

let to_bin = function
  | 'F' | 'L' -> '0'
  | 'B' | 'R' -> '1'
  | _ -> assert false

let unwrap = function
  | Some v -> v
  | _ -> assert false

let max seats = unwrap (List.max_elt seats ~compare:Int.compare)

let min seats = unwrap (List.min_elt seats ~compare:Int.compare)

let seat_id line = Int.of_string ("0b" ^ String.map line ~f:to_bin)

let day5_2 seats =
  let range = List.range (min seats) (max seats) in
  let valid_seats = Set.Poly.of_list range
  and filled_seats = Set.Poly.of_list seats in
  Set.diff valid_seats filled_seats

let () =
  let input = In_channel.input_lines In_channel.stdin
  and output = printf "%d\n" in
  let seats = List.map input ~f:seat_id in
  max seats |> output;
  day5_2 seats |> Set.iter ~f:output
