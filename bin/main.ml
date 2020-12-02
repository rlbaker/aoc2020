open Base
open Stdio

let to_int acc line = Int.of_string line :: acc

let read_input = In_channel.fold_lines ~init:[] ~f:to_int In_channel.stdin

let day1_1 input =
  let sum_2020 x y = Option.some_if (x + y = 2020) (x * y) in
  let f a = List.find_map input ~f:(sum_2020 a) in
  List.find_map input ~f

let day1_2 input =
  let sum_2020 x y z = Option.some_if (x + y + z = 2020) (x * y * z) in
  let f1 a b = List.find_map input ~f:(sum_2020 a b) in
  let f a = List.find_map input ~f:(f1 a) in
  List.find_map input ~f

let print_result = function
  | Some v -> printf "%d\n" v
  | _ -> ()

let () =
  let input = read_input in
  print_result (day1_1 input);
  print_result (day1_2 input)
