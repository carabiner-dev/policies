#!/usr/bin/env bash
#
# Tests for slsa/slsa-build-point.json policy
#
set -euo pipefail

AMPEL="${AMPEL:-../../../ampel/ampel}"
POLICY="../../slsa/slsa-build-point.json"
V1_ATT="slsa-buildv1.json"
V02_ATT="slsa-buildv02.json"

V1_SUBJECT="sha256:54ec7ddd81576363e4aeb3e71bf24f3ad09807e89cc6389ef56c803f2cf51fef"
V02_SUBJECT="sha256:3d6e80bd0a359ba9cc7117118ca4a53d1f53d87e6df5c06d9d0778690f571917"

V1_URI="git+https://github.com/puerco/mild-to-wild-samples"
V1_URI_REF="git+https://github.com/puerco/mild-to-wild-samples@refs/heads/main"
V1_COMMIT="c647c7e15e7e1c469cd587066c664c3d99208bba"

V02_URI="git+https://gitlab.com/redhat/rhel/containers/tekton-pipelines.git"
V02_COMMIT="626bba8a7c01810c0e659db8bb8a52943ef22279"

PASS=0
FAIL=0

cd "$(dirname "$0")"

run_test() {
    local name="$1"
    local expect="$2" # "pass" or "fail"
    shift 2

    local output
    if output=$("$AMPEL" verify "$@" 2>&1); then
        local result="pass"
    else
        local result="fail"
    fi

    if [[ "$result" == "$expect" ]]; then
        echo "  PASS: $name"
        PASS=$((PASS + 1))
    else
        echo "  FAIL: $name (expected $expect, got $result)"
        echo "$output" | head -20
        FAIL=$((FAIL + 1))
    fi
}

echo "=== SLSAv1 tests ==="

run_test "v1: exact URI + commit match" pass \
    "$V1_SUBJECT" \
    -a "$V1_ATT" -p "$POLICY" \
    -x "buildPoint:$V1_URI_REF" \
    -x "buildPointCommit:sha1:$V1_COMMIT" \
    -x "buildPointAllowRepo:false"

run_test "v1: repo-only match (no @ref in buildPoint)" pass \
    "$V1_SUBJECT" \
    -a "$V1_ATT" -p "$POLICY" \
    -x "buildPoint:$V1_URI" \
    -x "buildPointCommit:sha1:$V1_COMMIT"

run_test "v1: repo-only match without commit" pass \
    "$V1_SUBJECT" \
    -a "$V1_ATT" -p "$POLICY" \
    -x "buildPoint:$V1_URI_REF"

run_test "v1: commit without algorithm prefix" pass \
    "$V1_SUBJECT" \
    -a "$V1_ATT" -p "$POLICY" \
    -x "buildPoint:$V1_URI_REF" \
    -x "buildPointCommit:$V1_COMMIT"

run_test "v1: wrong commit should fail" fail \
    "$V1_SUBJECT" \
    -a "$V1_ATT" -p "$POLICY" \
    -x "buildPoint:$V1_URI_REF" \
    -x "buildPointCommit:sha1:0000000000000000000000000000000000000000"

run_test "v1: wrong repo should fail" fail \
    "$V1_SUBJECT" \
    -a "$V1_ATT" -p "$POLICY" \
    -x "buildPoint:git+https://github.com/someone/other-repo@refs/heads/main"

run_test "v1: exact match fails when ref differs and allowRepo=false" fail \
    "$V1_SUBJECT" \
    -a "$V1_ATT" -p "$POLICY" \
    -x "buildPoint:git+https://github.com/puerco/mild-to-wild-samples@refs/heads/develop" \
    -x "buildPointAllowRepo:false"

run_test "v1: ref mismatch passes when allowRepo=true (default)" pass \
    "$V1_SUBJECT" \
    -a "$V1_ATT" -p "$POLICY" \
    -x "buildPoint:git+https://github.com/puerco/mild-to-wild-samples@refs/heads/develop"

echo ""
echo "=== SLSAv0.2 tests ==="

run_test "v0.2: exact URI + commit match" pass \
    "$V02_SUBJECT" \
    -a "$V02_ATT" -p "$POLICY" \
    -x "buildPoint:$V02_URI" \
    -x "buildPointCommit:sha1:$V02_COMMIT" \
    -x "buildPointAllowRepo:false"

run_test "v0.2: repo-only match (buildPoint has @ref, material doesn't)" pass \
    "$V02_SUBJECT" \
    -a "$V02_ATT" -p "$POLICY" \
    -x "buildPoint:${V02_URI}@refs/heads/main" \
    -x "buildPointCommit:sha1:$V02_COMMIT"

run_test "v0.2: URI match without commit" pass \
    "$V02_SUBJECT" \
    -a "$V02_ATT" -p "$POLICY" \
    -x "buildPoint:$V02_URI"

run_test "v0.2: commit without algorithm prefix" pass \
    "$V02_SUBJECT" \
    -a "$V02_ATT" -p "$POLICY" \
    -x "buildPoint:$V02_URI" \
    -x "buildPointCommit:$V02_COMMIT"

run_test "v0.2: wrong commit should fail" fail \
    "$V02_SUBJECT" \
    -a "$V02_ATT" -p "$POLICY" \
    -x "buildPoint:$V02_URI" \
    -x "buildPointCommit:sha1:0000000000000000000000000000000000000000"

run_test "v0.2: wrong repo should fail" fail \
    "$V02_SUBJECT" \
    -a "$V02_ATT" -p "$POLICY" \
    -x "buildPoint:git+https://gitlab.com/someone/other-repo.git"

run_test "v0.2: exact match fails when material has no ref and allowRepo=false" fail \
    "$V02_SUBJECT" \
    -a "$V02_ATT" -p "$POLICY" \
    -x "buildPoint:${V02_URI}@refs/heads/main" \
    -x "buildPointAllowRepo:false"

echo ""
echo "=== Results ==="
echo "  $PASS passed, $FAIL failed"

if [[ "$FAIL" -gt 0 ]]; then
    exit 1
fi
