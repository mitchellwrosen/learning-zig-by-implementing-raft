#### April 25, 2023

TODO write a proper intro to this project.

Today I sat down and installed `zig` and `zls` with [nix](./flake.nix), then began reading through the website.

#### April 26, 2023

I spent some time trying to rig up a fast feedback loop. I eventually settled on using
[entr](https://eradman.com/entrproject/) to watch for changes to `src/*.zig` files, but I'm not entirely satisfied.
It's good enough for now.

```bash
fd . src | entr zig build run
```

I then started to read [ziglearn](https://ziglearn.org/), which is linked from the main Zig website.

Two minor complaints from my experience so far:

1. The compiler errors are enormous and hideous. I'm using a `nix`-provided `zig` binary, and am in a directory
with a somewhat long name (`/home/mitchell/projects/learning-zig-by-implementing-raft/`), both of which are
contributing to the overwhelming size of the error output:

  ```
  /home/mitchell/projects/learning-zig-by-implementing-raft/src/main.zig:18:11: error: unused local constant
      const x : i32 = 5;
            ^
  error: learning-zig-by-implementing-raft...
  error: The following command exited with error code 1:
  /nix/store/50dflzl0472gwzpnwhxylnj4a4a0i6q7-zig-0.10.1/bin/zig build-exe /home/mitchell/projects/learning-zig-by-implementing-raft/src/main.zig --cache-dir /home/mitchell/projects/learning-zig-by-implementing-raft/zig-cache --global-cache-dir /home/mitchell/.cache/zig --name learning-zig-by-implementing-raft --enable-cache
  error: the following build command failed with exit code 1:
  /home/mitchell/projects/learning-zig-by-implementing-raft/zig-cache/o/1b87f6db8b6ab3b8913b75f038200c02/build /nix/store/50dflzl0472gwzpnwhxylnj4a4a0i6q7-zig-0.10.1/bin/zig /home/mitchell/projects/learning-zig-by-implementing-raft /home/mitchell/projects/learning-zig-by-implementing-raft/zig-cache /home/mitchell/.cache/zig run
  ```

2. Unused locals are errors, with no way to reduce the error to a warning. This seems to be a controversial issue in
the Zig community at the moment, so I'll refrain from saying too much more. https://github.com/ziglang/zig/issues/3320

  In brief, though: this seems like a bad decision. I'd really prefer to be able to run my program without addressing
  every unused local, _and_ occasionally intentionally leave around an unused local as a reminder to myself to come
  back something later.
