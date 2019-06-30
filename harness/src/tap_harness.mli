open! Base
open! Stdio
open! Import

type result =
  { tests_run : int
  ; failed : int
  }

val run_from_in_channel : In_channel.t -> result
