open! Base
open! Stdio
open! Import

let all_tests = ref []
let test name f = all_tests := (name, f) :: !all_tests

let run_tests () =
  let tests = List.rev !all_tests in
  let n = List.length tests in
  let failures = ref 0 in
  printf "1..%d\n" n;
  List.iteri tests ~f:(fun i (name, f) ->
    let index = i + 1 in
    match f () with
    | () -> printf "ok %d - %s\n" index name
    | exception exn ->
      printf !"not ok %d - %s (%{Exn#mach})\n" index name exn;
      Int.incr failures);
  printf "%d tests run, %d successes, %d failures\n" n (n - !failures) !failures;
  let exit_code = if !failures > 254 then 254 else !failures in
  Caml.exit exit_code
;;

let () = Caml.at_exit run_tests
