open Base
open Stdio

let day1_1 input =
  let sum_2020 x y = Option.some_if (x + y = 2020) (x * y) in
  let f a = List.find_map input ~f:(sum_2020 a) in
  List.find_map input ~f

let day1_2 input =
  let sum_2020 x y z = Option.some_if (x + y + z = 2020) (x * y * z) in
  let g a b = List.find_map input ~f:(sum_2020 a b) in
  let f a = List.find_map input ~f:(g a) in
  List.find_map input ~f

let read_input =
  let to_int acc line = Int.of_string line :: acc in
  In_channel.fold_lines In_channel.stdin ~init:[] ~f:to_int

let () =
  let input = read_input in
  let print_result = function
    | Some v -> printf "%d\n" v
    | _ -> ()
  in
  print_result (day1_1 input);
  print_result (day1_2 input)
