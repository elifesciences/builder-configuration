# builder-configuration
Contains non-sensitive Salt formulas configuration


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
        # user: 
        # password: 
```

are sensitive, and are configured in [builder-private](https://github.com/elifesciences/builder-private/tree/master/pillar) instead.

Values clearly fake, tagged like

```
my_project:
    orcid:
        client_id: fake_client_id # overwritten by environment
```

will be overridden by `builder-private` for certain environments (like `prod`) with real values.
