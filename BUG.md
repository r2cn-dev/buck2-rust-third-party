## Bug List

### critical-section-1.1.3

```bash
buck2 build //third-party/rust/crates/critical-section/1.1.3:critical-section-restore-state-usize
```

```bash
Action failed: root//third-party/rust/crates/critical-section/1.1.3:critical-section-restore-state-usize (failure_filter diag)
Local command returned non-zero exit code 1
Reproduce locally: `env -- 'BUCK_SCRATCH_PATH=buck-out/v2/tmp/root/af28991d2c6d7ebb/failure_filter/diag' /usr/bin/env 'P ...<omitted>... tic_pic-metadata-fast-diag/critical_section_restore_state_usize-metadata-fast_build_status-diag.json (run `buck2 log what-failed` to get the full command)`
stdout:
stderr:
error[E0308]: mismatched types
   --> third-party/rust/crates/critical-section/1.1.3/src/lib.rs:150:21
    |
150 |         return Self(());
    |                ---- ^^ expected `usize`, found `()`
    |                |
    |                arguments to this function are incorrect
    |
note: tuple struct defined here
   --> third-party/rust/crates/critical-section/1.1.3/src/lib.rs:132:12
    |
132 | pub struct RestoreState(RawRestoreState);
    |            ^^^^^^^^^^^^


error: aborting due to 1 previous error


For more information about this error, try `rustc --explain E0308`.

Missing required input file rlib-pic-static_pic-metadata-fast-diag/libcritical_section_restore_state_usize-69c32067.rmeta (buck-out/v2/gen/root/200212f73efcd57d/third-party/rust/crates/critical-section/1.1.3/__critical-section-restore-state-usize__/rlib-pic-static_pic-metadata-fast-diag/libcritical_section_restore_state_usize-69c32067.rmeta)
Build ID: d46e9ebb-c371-49a7-b5a9-dbb2789d24f2
Analyzing targets. Remaining     0/1
Executing actions. Remaining     0/5                                                                  0.1s exec time total
Command: build.    Finished 2 local
Time elapsed: 0.1s
BUILD FAILED
Failed to build 'root//third-party/rust/crates/critical-section/1.1.3:critical-section-restore-state-usize (prelude//platforms:default#200212f73efcd57d)'
```
