open Base
open Stdio

let len f = function
  | init :: tail -> List.fold tail ~init ~f |> Set.length
  | _ -> 0

let sum f = List.sum (module Int) ~f

let day6_1 = len Set.union |> sum

let day6_2 = len Set.inter |> sum

let read_input =
  let to_set s = String.to_list s |> Set.of_list (module Char) in
  let to_sets s = String.split_lines s |> List.map ~f:to_set in
  In_channel.input_all In_channel.stdin
  |> String.substr_replace_all ~pattern:"\n\n" ~with_:"|"
  |> String.split ~on:'|' |> List.map ~f:to_sets

let () =
  let input = read_input
  and output = printf "%d\n" in
  day6_1 input |> output;
  day6_2 input |> output
