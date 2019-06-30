open! Base
open! Stdio
open Tap_harness

let () =
  try
    let result = Tap_harness.run_from_in_channel In_channel.stdin in
    let exit_code = if result.failed > 254 then 254 else result.failed in
    Caml.exit exit_code
  with
  | exn ->
    prerr_endline (Exn.to_string exn);
    Caml.exit 255
;;
