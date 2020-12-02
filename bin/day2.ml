open Base
open Stdio

type record =
  { min : int
  ; max : int
  ; ch : char
  ; pw : string
  }

let re = Re.Posix.compile_pat "([0-9]+)-([0-9]+) ([a-z]): ([a-z]+)"

let record_of_string line =
  let matches = Re.exec re line in
  { min = Int.of_string (Re.Group.get matches 1)
  ; max = Int.of_string (Re.Group.get matches 2)
  ; ch = Char.of_string (Re.Group.get matches 3)
  ; pw = Re.Group.get matches 4
  }

let read_input =
  let f acc line = record_of_string line :: acc in
  In_channel.fold_lines In_channel.stdin ~init:[] ~f

let day2 f input = List.length (List.filter ~f input)

let is_valid1 r =
  let f ch = Char.(ch = r.ch) in
  let count = String.count ~f r.pw in
  count >= r.min && count <= r.max

let is_valid2 r =
  let match1 = Char.(r.ch = r.pw.[r.min - 1]) in
  let match2 = Char.(r.ch = r.pw.[r.max - 1]) in
  Bool.(match1 <> match2)

let () =
  let input = read_input in
  let output = printf "%d\n" in
  day2 is_valid1 input |> output;
  day2 is_valid2 input |> output
