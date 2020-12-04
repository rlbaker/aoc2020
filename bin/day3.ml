open Base
open Stdio

let gen_positions (dx, dy) xwrap ymax =
  let wrap x = x % xwrap in
  let next (x, y) = (wrap (x + dx), y + dy) in
  let rec f pos lst =
    match pos with
    | _, y when y >= ymax -> pos :: lst
    | _ -> f (next pos) (pos :: lst)
  in
  f (0, 0) []

let day3_1 input slope =
  let ymax = Array.length input - 1 in
  let xmax = Array.length input.(0) in
  let positions = gen_positions slope xmax ymax in
  let f count (x, y) =
    match input.(y).(x) with
    | '#' -> count + 1
    | _ -> count
  in
  List.fold positions ~init:0 ~f

let day3_2 input =
  let slopes = [ (1, 1); (3, 1); (5, 1); (7, 1); (1, 2) ] in
  let f result slope = result * day3_1 input slope in
  List.fold slopes ~init:1 ~f

let read_input =
  In_channel.input_lines In_channel.stdin
  |> List.map ~f:String.to_array
  |> List.to_array

let () =
  let input = read_input in
  let output = printf "%d\n" in
  day3_1 input (3, 1) |> output;
  day3_2 input |> output
