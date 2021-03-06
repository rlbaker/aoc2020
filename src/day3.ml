open Base
open Stdio

let gen_positions (dx, dy) xwrap ymax =
  let wrap x = x % xwrap in
  let next (x, y) = (wrap (x + dx), y + dy) in
  let rec f lst = function
    | (_, y) as pos when y >= ymax -> pos :: lst
    | pos -> f (pos :: lst) (next pos)
  in
  f [] (0, 0)

let day3_1 input slope =
  let ymax = Array.length input - 1
  and xwrap = Array.length input.(0) in
  let positions = gen_positions slope xwrap ymax in
  let f count (x, y) =
    match input.(y).(x) with
    | '#' -> count + 1
    | _ -> count
  in
  List.fold positions ~init:0 ~f

let day3_2 input =
  let f result slope = result * day3_1 input slope in
  List.fold ~init:1 ~f [ (1, 1); (3, 1); (5, 1); (7, 1); (1, 2) ]

let read_input =
  In_channel.input_lines In_channel.stdin |> List.map ~f:String.to_array |> List.to_array

let () =
  let input = read_input in
  let output = printf "%d\n" in
  day3_1 input (3, 1) |> output;
  day3_2 input |> output
