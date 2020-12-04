open Base
open Stdio

let range min max s =
  let v = Int.of_string s in
  min <= v && v <= max

let hgt ~cm ~inch s =
  let check s (min, max) suffix =
    match String.chop_suffix ~suffix s with
    | Some s -> range min max s
    | None -> false
  in
  check s cm "cm" || check s inch "in"

let matches pattern = Re.Posix.compile_pat pattern |> Re.execp

let field_validations =
  [ ("byr", range 1920 2002)
  ; ("iyr", range 2010 2020)
  ; ("eyr", range 2020 2030)
  ; ("hgt", hgt ~cm:(150, 193) ~inch:(59, 76))
  ; ("hcl", matches "^#[0-9a-f]{6}$")
  ; ("ecl", matches "amb|blu|brn|gry|grn|hzl|oth")
  ; ("pid", matches "^[0-9]{9}$")
  ]

let valid1 passport =
  let check passport substring = String.is_substring ~substring passport in
  let f is_valid (field, _) = is_valid && check passport field in
  List.fold field_validations ~init:true ~f

let valid2 passport =
  let split_fields = String.split_on_chars ~on:[ ' '; '\n' ] in
  let split_field = String.lsplit2_exn ~on:':' in
  let fields = List.map (split_fields passport) ~f:split_field in
  let tbl = Hashtbl.of_alist_exn (module String) fields in
  let if_not_found _ = false in
  let f (k, if_found) = Hashtbl.find_and_call tbl k ~if_found ~if_not_found in
  List.for_all field_validations ~f

let day4 input validator = List.map input ~f:validator |> List.count ~f:Fn.id

let read_input =
  let replace pattern with_ = String.substr_replace_all ~pattern ~with_ in
  let split s = replace "\n\n" "|" s |> String.split ~on:'|' in
  let compact s = replace "\n" " " s |> String.strip in
  In_channel.input_all In_channel.stdin |> split |> List.map ~f:compact

let () =
  let input = read_input in
  let output = printf "%d\n" in
  day4 input valid1 |> output;
  day4 input valid2 |> output
