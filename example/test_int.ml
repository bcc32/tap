open! Base
open! Stdio
open! Import
open Tap

let () = test "Int.pow 2 2" (fun () -> [%test_result: int] ~expect:2 (Int.pow 2 2))
let () = test "Int.pow 2 3" (fun () -> [%test_result: int] ~expect:8 (Int.pow 2 3))
