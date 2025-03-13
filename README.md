# Fabric Custom Patterns

This repo stores my custom patterns for Daniel Miessler's framework [Fabric](https://github.com/danielmiessler/fabric). For more information, see the [Fabric documentation](https://github.com/danielmiessler/fabric#readme).

## Creating New Patterns

Fabric's `create_pattern` pattern is pretty good at creating a new pattern. You can create a written description of what you'd like the pattern to do, copy it to the clipboard, and then run `pbpaste | fabric create_pattern`. It often is worth splurging for a bigger model for these, which you can do by adding the model flag like so: `pbpaste | fabric create_pattern -m claude-3-5-sonnet-latest`.

## Adding Patterns to Fabric

This repo assumes that Fabric is storing its patterns in the default location (`~/.config/fabric/patterns`). It includes a git hook that automatically copies all pattern folders to Fabric's patterns directory (`~/.config/fabric/patterns`) whenever you commit to the `main` branch. You can also manually copy each pattern's folder into Fabric's patterns directory.

### Setting Up the Hooks

After cloning this repository, run the setup script to configure the git hooks:

```bash
./setup-hooks.sh
```

This will configure git to use the hooks included in this repository. Once set up, any commit to the `main` branch will automatically copy all pattern folders to your local Fabric patterns directory.
