open Base

let day1_1 input =
  let sum_2020 x y = Option.some_if (x + y = 2020) (x * y) in
  let f a = List.find_map input ~f:(sum_2020 a) in
  List.find_map input ~f

let day1_2 input =
  let sum_2020 x y z = Option.some_if (x + y + z = 2020) (x * y * z) in
  let g a b = List.find_map input ~f:(sum_2020 a b) in
  let f a = List.find_map input ~f:(g a) in
  List.find_map input ~f
