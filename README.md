# FishFace

Shows an ASCII fish which is blue or green when in a git repo.

![fishface theme](https://f.cloud.github.com/assets/66143/1224622/ec9660d8-2750-11e3-9c96-cb7a5a69eada.png)

# Disable branch name

To disable the branch name on the right side prompt, comment out the following line of code.

```bash
set -l git_dir (git rev-parse --git-dir 2> /dev/null)
```

# Resources

## Git branch info

Git branch functionality was inspired from [davidmh](https://github.com/davidmh)'s [config.fish](https://gist.github.com/721241c7c34f841eed07).
