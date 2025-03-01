## Third-Party Crate Working Process

### Download crate without cargo

The crate URL is `https://static.crates.io/crates/{crate}/{crate}-{version}.crate`, download the crate using `wget` like this:

```bash
wget https://static.crates.io/crates/cfg-if/cfg-if-1.0.0.crate
tar -xvf cfg-if-1.0.0.crate
rm cfg-if-1.0.0.crate
mv cfg-if-1.0.0 1.0.0
pwd
# buck2-rust-third-party/third-party/rust/crates/cfg-if/1.0.0
```

### Add Buck2 configs

Copy `toolchains` folder and `.buckconfig` file from other crate into working directory:

```
cd 1.0.0
mkdir toolchains
cp -r ../../shlex/1.3.0/toolchains .
cp ../../shlex/1.3.0/.buckconfig .
```

### Add crate to project as dependency

Add `//third-party/rust/crates/cfg-if/1.0.0:cfg-if` to `deps` list:

```
load("@prelude//rust:cargo_package.bzl", "cargo")

cargo.rust_binary(
    name = "buck2-rust-third-party",
    edition = "2021",
    srcs = glob(["src/**/*.rs"]),
    crate_root = "src/main.rs",
    deps = [
        "//third-party/rust/crates/libc/0.2.169:libc",
        "//third-party/rust/crates/shlex/1.3.0:shlex",
        "//third-party/rust/crates/zstd-sys/2.0.13+zstd.1.5.6:zstd-sys",
        "//third-party/rust/crates/cfg-if/1.0.0:cfg-if",
    ],
    visibility = ["PUBLIC"],
)
```

### Write BUCK for the crate

```
load("@prelude//rust:cargo_package.bzl", "cargo")

cargo.rust_library(
    name = "cfg-if",
    srcs = glob(["**/*.rs"]),
    edition = "2018",
    visibility = ["PUBLIC"],
    deps = [],
)
```

### Clean the crate folder

```
cd ..
rm -rf 1.0.0
```

### Clean the crate folder

```
cd ..
rm -rf .github
rm -rf .devcontainer
```

### Tips

For now, I am trying to generate `BUCK` with `Cargo.toml` with Claude, and the promote words in Chinese:


编写附件 Cargo.toml 对应功能的 BUCK 文件，满足 Buck2 编译的需求，要求包括：

1. BUCK 文件中的注释使用英文；
2. 交互过程使用中文；
3. 使用 `load("@prelude//rust:cargo_package.bzl", "cargo")`;
4. BUCK 文件中没有 `version` 和 `licenses` 字段；
5. BUCK 文件中 `edition` 字段固定使用 `2021`；
6. 如果有依赖存在，请使用 `//third-party/rust/crates/<crate_name>/<crate_version>:<crate_name>` 来替换；
7. 请在基础模板下进行修改：
```
load("@prelude//rust:cargo_package.bzl", "cargo")

cargo.rust_library(
    name = "",
    edition = "2021",
    srcs = glob(["src/**/*.rs"]),
    crate_root = "src/lib.rs",
    visibility = ["PUBLIC"],
    features = ["default"],
    deps = [],
)
```
