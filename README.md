# AMPEL Community Policies

This repository contains a reusable collection of policies to use with the
🔴🟡🟢 [AMPEL Policy Engine](https://github.com/policylabs/ampel).

The policies contained here are free to use and we always welcome patches and
contributions!

Every policy, policy set and policy group has a document of its own next to
its source, and every directory has a README indexing what it holds. Both are
generated from the policy sources with `make docs`.

## Policies By Supply Chain Technology

The repository contains policies for the following supply chain technologies
and formats:

- [AIIR](aiir/): Policies for AIIR commit receipt attestations
- [gitsign](gitsign/): Policies for commits signed with gitsign
- [Grype](grype/): Policies for Grype vulnerability scan results
- [OMS](oms/): Policies for OpenSSF Model Signing signatures
- [OpenEoX](openeox/): Policies to work with end of life/end of support data
- [OpenVEX](openvex/): Policies for OpenVEX exploitability data
- [OSV](osv/): Policies for OSV vulnerability scan results
- [protobom](protobom/): SBOM policies reading documents through the protobom API
- [SBOM](sbom/): Software Bill of Materials
- [Scorecard](scorecard/): OpenSSF Scorecard
- [Security Insights](security-insights/): Security Insights Specification
- [Signature](signature/): Detached signature verification
- [Sigstore](sigstore/): Sigstore signing identity checks
- [SLSA](slsa/): Supply Chain Levels for Software Artifacts
- [SLSA Source](slsa-source/): SLSA Source Attestations
- [Snappy](snappy/): The Carabiner API snaphotter
- [test-results](test-results/): In-toto test results predicate
- [Trivy](trivy/): Policies for Trivy vulnerability scan results
- [VSA](vsa/): Verification Summary Attestation

## Community PolicySets and Groups

Additionally we are also in the process of creating a community driven
collection of policy sets and groups, modeling popular frameworks and best
practices. Here are some early examples:

- [OSPS Baseline](sets/baseline/): OpenSSF's Open Source Project Security Baseline
- [OSPS Baseline groups](groups/osps-baseline/): One policy group per OSPS Baseline control
- [NTIA Minimum Elements](sets/ntia-minimum-elements/): NTIA's Minimum Elements for Software Bill of Materials
- [CISA 2026 SBOM Minimum Elements](groups/cisa-sbom-2026/): CISA's 2026 Minimum Elements for Software Bill of Materials
- [SLSA Build Levels](sets/slsa/): Policy sets for SLSA build levels 1 to 3

## Contributing

This is a community project and as such, we are happy to get contributions, issues, new policies,
and PolicySets! Feel free to open issues or pull requests to this repo to make things better for everyone!

The `.hjson` files are the policy sources. Edit those, then run `make json` to
refresh the compiled JSON twins and `make docs` to refresh the documentation
and the directory indexes. Text outside the index markers of a README survives
regeneration, so introductions can be hand written.
