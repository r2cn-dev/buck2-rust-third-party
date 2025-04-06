
fn main() {
  use std::env::var;
  use std::path::Path;
  if var("TARGET")
    .map(|target| target == "x86_64-pc-windows-msvc")
    .unwrap_or(false)
  {
    let dir = var("CARGO_MANIFEST_DIR").unwrap();
    println!(
      "cargo:rustc-link-search=native={}",
      Path::new(&dir).join("lib").display()
    );
  }
}
