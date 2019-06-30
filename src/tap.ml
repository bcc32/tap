open! Base
open! Stdio
open! Import

let all_tests = ref []
let test name f = all_tests := (name, f) :: !all_tests

let run_tests () =
  let tests = List.rev !all_tests in
  printf "1..%d\n" (List.length tests);
  List.iteri tests ~f:(fun i (name, f) ->
    let index = i + 1 in
    match f () with
    | () -> printf "ok %d - %s\n" index name
    | exception exn -> printf !"not ok %d - %s (%{Exn#mach})\n" index name exn)
;;

let () = Caml.at_exit run_tests
