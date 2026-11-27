# Contributing to the AMPEL Community Policies

Thank you for helping make these policies better! New policies, policy sets,
policy groups, fixes, tests and documentation improvements are all welcome.
Open an issue to discuss an idea, or go straight to a pull request.

This guide covers what a pull request needs to pass review and CI.

## The short version

1. Edit the `.hjson` source, never the generated `.json` or `.md` next to it.
2. Run `make json docs` to regenerate the JSON twins and the documentation.
3. Run `go test ./...`.
4. Commit the source and every generated file together, signed off
   (`git commit -s`).

## What you need

- [Go](https://go.dev/dl/), at the version in [`go.mod`](go.mod) or newer.
- `make` and `git`.

Nothing else needs installing. The compiler and documentation generator,
`policyctl`, runs with `go tool` at the version pinned in `go.mod`.

## Sources and generated files

Every policy, policy set and policy group is written in
[HJSON](https://hjson.github.io/), and two files are generated from it:

| File | What it is | Edit it? |
|------|------------|----------|
| `name.hjson` | The source | Yes |
| `name.json` | The JSON twin, compiled from the source for consumers that read plain JSON | No, generated |
| `name.md` | The document describing the policy | No, generated |
| `README.md` in each directory | The index of what the directory holds | Only outside the index markers |

A few older policies only have a `.json` file. For those the `.json` is the
source, until someone ports it to HJSON.

Changes made by hand to a generated file are lost the next time it is
generated, and CI rejects a pull request where a generated file does not match
its source.

### Regenerating

After changing a source, run this at the root of the repository:

```sh
make json docs
```

`make json` compiles the twins and `make docs` writes the documents and the
directory indexes. Only the files whose source changed are rebuilt. To rebuild
everything regardless, which is what CI does, run:

```sh
make -B json docs
```

Commit the regenerated files in the same pull request as the source.

Compiling resolves the policies a source references by fetching them from
GitHub, so it needs network access. That fetch fails now and then with an error
about cloning or checking out a commit; run the command again.

### Directory READMEs

The table between the `<!-- policyctl:index:...:begin -->` and `:end` markers
of a README is generated. Text outside the markers is preserved, so titles and
introductions can be written by hand.

## Writing a policy

- Put the policy in the directory of the technology or format it checks
  (`slsa/`, `openvex/`, `sbom/`...). Policy sets go under `sets/` and policy
  groups under `groups/`.
- Give it a stable `id` and, under `meta`, a `name` and a `description` saying
  what it checks and when it fails. The documentation is generated from them.
- A new directory needs an entry in the list in the root
  [README](README.md).

### Referencing other policies

Sets and groups reference the policies they are made of with a locator naming
this repository, a commit and the path of the file:

```
git+https://github.com/policylabs/policies@<full commit sha>#slsa/slsa-builder-id.json
```

- Use `policylabs/policies`, the home of this repository.
- Pin the reference to a full commit. The compiled twin embeds the policy as
  it was at that commit.
- The commit has to be on `main`, because the compiler fetches it from GitHub.
  A set or group built on policies that are new or changed therefore takes two
  pull requests: the first adds the policies, the second adds or updates the
  set, pinned to the commit the first one merged as.

A source that cannot compile yet, because what it references is not merged,
can be listed in `EXCLUDE` in the [`Makefile`](Makefile) so it is neither
compiled nor documented. Take it off the list as soon as it compiles.

## Testing

Policies are tested by evaluating them against attestation fixtures. Each
directory declares its tests in a `.ptests.yaml` file and the fixtures live
under [`testdata/`](testdata/):

```yaml
tests:
  - name: vexing-fails-when-vulns-not-vexed
    policy: project-is-vexing.json
    expect: FAIL
    subject: "sha256:7950b24d06407456038435a2a3dfd99531ae8e35940b6fc4dae3cd6f1b504585"
    attestations:
      - ../testdata/openvex/osv-with-vulns.intoto.json
```

Run them all with:

```sh
go test ./...
```

- A new policy comes with tests: at least one case that passes and one that
  fails.
- A fix comes with a test that fails without it.
- A test that names a `.json` policy runs the twin, so regenerate the twins
  before testing.
- A test that needs a feature of a recent AMPEL release states the first
  version it works with in `ampel-version`. The tests run against more than
  one version of the engine and the case is skipped on older ones.

## What CI checks

Every pull request runs two jobs:

- **test** runs `go test ./...`.
- **Generated files are up to date** rebuilds every twin and document and
  fails when the result differs from what the pull request commits, or when a
  source does not compile. The failure message lists the files and the command
  that fixes them, which is almost always `make -B json docs` followed by
  committing the result.

## Pull requests

- Keep each pull request to one logical change.
- Sign off your commits with `git commit -s`, certifying the
  [Developer Certificate of Origin](https://developercertificate.org/).
- Say in the description what the policy checks or what the change fixes.

Contributions are licensed under the [Apache License 2.0](LICENSE).
