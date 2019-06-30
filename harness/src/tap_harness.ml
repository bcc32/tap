open! Base
open! Stdio
open! Import

let parse_plan string =
  match String.chop_prefix_exn string ~prefix:"1.." with
  | "0" -> `Unknown
  | num_tests -> `Known (Int.of_string num_tests)
;;

let parse_test_line string =
  if String.is_prefix string ~prefix:"ok "
  then `Ok
  else if String.is_prefix string ~prefix:"not ok "
  then `Not_ok
  else `Not_a_test_line
;;

type result =
  { tests_run : int
  ; failed : int
  }

let run_from_in_channel chan =
  let plan = parse_plan (In_channel.input_line_exn chan) in
  let test_count = ref 0 in
  let failure_count = ref 0 in
  let rec loop () =
    match In_channel.input_line chan with
    | None -> ()
    | Some line ->
      (match parse_test_line line with
       | `Ok -> Int.incr test_count
       | `Not_ok ->
         Int.incr test_count;
         Int.incr failure_count
       | `Not_a_test_line -> ());
      loop ()
  in
  loop ();
  (match plan with
   | `Unknown -> ()
   | `Known n ->
     if n <> !test_count
     then printf "Test plan mismatch: expected %d tests, found %d\n" n !test_count);
  printf
    "Ran %d tests; %d ok, %d not ok\n"
    !test_count
    (!test_count - !failure_count)
    !failure_count;
  { tests_run = !test_count; failed = !failure_count }
;;
