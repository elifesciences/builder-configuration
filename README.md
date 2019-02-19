# builder-configuration
Contains non-sensitive Salt formulas configuration

## Environments

`pillar/environment-*-public.sls` correspond to environments.

| Environment name | Other projects | External organizations | Tests | Runtime
| ---------------- |:--------------:|:----------------------:|:-----:|:-------:|
| `ci` | no | no | automated | only during test runs
| `end2end` | yes | no | automated | only during test runs
| `continuumtest` (deprecated), `staging` | yes | sandboxes only | manual, exploratory | always
| `demo` | dummies | no | manual, demonstrative | always
| `prod` | yes | yes | smoke only | always

## Naming convention

Pillar files applied to projects must be named:

```
pillar/my-project-public.sls
```

mimicking the `pillar/my-project.sls` file found in `builder-private`.

Once added, these files must be composed into [top.sls](https://github.com/elifesciences/builder-private/blob/master/pillar/top.sls) to be used.

## Pillar values

Commented-out values such as

```
my_project:
    database:
        host: localhost
        # user: 
        # password: 
```

are sensitive, and are configured in [builder-private](https://github.com/elifesciences/builder-private/tree/master/pillar) or [Vault](https://master-server.elifesciences.org:8200/ui/) instead.

Values clearly fake, tagged like

```
my_project:
    orcid:
        client_id: fake_client_id # overwritten by environment
```

will be overridden by `builder-private` or Vault for certain environments (like `prod`) with real values.

In case a dictionary does not have any public values to include here, it's safer to make the schema of the data consistent with an empty `{}`:

```
my_project:
    database: {}
        # user: 
        # password: 
```

Pillar merging will normally overwrite the `None` value with a dictionary, but a `None` will overwrite a dictionary coming from a file that gets included earlier like `elife.sls`.
