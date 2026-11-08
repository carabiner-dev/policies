# Tagged Commit Carries the Named Tree

Passes when the commit the release tag points at carries the tree
the tag's `Tree` trailer names.

A release tag lands on the commit a merge produced while the
policies were evaluated on the pull request's head; what makes
the tag honest is that both commits carry the same tree. The tag
names that tree in its signed `Tree` trailer. This policy chains
from the tag to the tagged commit and checks the commit's own
tree, read from its attestation (`https://carabiner.dev/git/commit/v0`,
synthesized from the commit object), against the trailer. Its
sibling `release-evaluated-commit-tree` does the same for the
evaluated commit; together they establish the two trees are one.

## Overview

| Property | Value |
|----------|-------|
| **Type** | Policy |
| **ID** | `release-tagged-commit-tree` |
| **Assert mode** | AND |
| **Tenets** | 1 |
| **Enforce** | ON |

## Structure

```mermaid
flowchart TD
    subgraph inputs["Inputs"]
        A0["📄 https://carabiner.dev/git/commit/v0"]
        L0["⛓️ https://carabiner.dev/git/tag/v0<br/>#quot;sha1:#quot; + predicate.data.object"]
    end
    P["🛡️ Tagged Commit Carries the Named Tree"]
    inputs --> P
    P --> P_T0["📋 tree-matches"]
```

## Tenets

### Tenet: `tree-matches`

**Evaluation:**
```cel
predicate.data.tree == chain[0].predicate.data.trailers["Tree"][0]
```

**On pass:** The tagged commit carries the tree the tag names

**On fail:** The tagged commit does not carry the tree the tag names
**Guidance:** The release tag's Tree trailer must name the tagged commit's tree. A tag whose target carries another tree was cut on content the policies never saw.

