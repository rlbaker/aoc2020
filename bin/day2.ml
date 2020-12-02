open Base
open Stdio
open Base.Poly

type record =
  { min : int
  ; max : int
  ; ch : char
  ; pw : string
  }

let record_of_string line =
  let matches =
    let pat = "([0-9]+)-([0-9]+) ([a-z]): ([a-z]+)" in
    Re.exec (Re.Posix.compile_pat pat) line
  in
  { min = Int.of_string (Re.Group.get matches 1)
  ; max = Int.of_string (Re.Group.get matches 2)
  ; ch = Char.of_string (Re.Group.get matches 3)
  ; pw = Re.Group.get matches 4
  }

let validator1 r =
  let f ch = Char.(ch = r.ch) in
  let count = String.count ~f r.pw in
  count >= r.min && count <= r.max

let validator2 r =
  let ch1 = r.pw.[r.min - 1] in
  let ch2 = r.pw.[r.max - 1] in
  Bool.(Char.(r.ch = ch1) <> Char.(r.ch = ch2))

let day2 input f =
  let valid_records = List.filter input ~f in
  List.length valid_records

let read_input =
  let f acc line = record_of_string line :: acc in
  In_channel.fold_lines In_channel.stdin ~init:[] ~f

let () =
  let input = read_input in
  let output = printf "%d\n" in
  day2 input validator1 |> output;
  day2 input validator2 |> output
