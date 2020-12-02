open Base
open Stdio

let read_input =
  let to_int acc line = Int.of_string line :: acc in
  In_channel.fold_lines In_channel.stdin ~init:[] ~f:to_int

let print_result = function
  | Some v -> printf "%d\n" v
  | _ -> ()

let () =
  let input = read_input in
  Advent.day1_1 input |> print_result;
  Advent.day1_2 input |> print_result
