# mod

Sets up configuration file for an Apache module from a template. The template should be in the same cookbook where the definition is used. This is used by the `apache2_module` definition and is not often used directly.

This will use a template resource to write the module's configuration file in the `mods-available` under the Apache configuration directory (`apache_dir`). This is a platform-dependent location.

## Properties

- `name` - Type: String - Name of the template.
- `root_group` - Type: String - Set to override the platforms default root group for the template file.'

## Examples

Create `#{apache_dir}/mods-available/alias.conf`.

```ruby
apache2_mod "alias"
```