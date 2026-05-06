# raster-move-endgame-mark

`raster-move-endgame-mark` explores chess and game engines in Elixir. The repository keeps the core rule set compact, then surrounds it with examples that show how the decisions move.

## Raster Move Endgame Mark Notes

The quickest review path is the verifier first, then the fixtures, then the operations note. That order makes it easy to see whether the code, data, and explanation still agree.

## Why This Exists

This is not a wrapper around a service. It is a self-contained project that shows how the model behaves when demand, capacity, latency, risk, and weight move in different directions.

## Code Tour

- `lib`: library code
- `test`: language test directory
- `fixtures`: compact golden scenarios
- `examples`: expanded scenario set
- `metadata`: project constants and verification metadata
- `docs`: operations and extension notes
- `scripts`: local verification and audit commands

## Feature Notes

- Includes extended examples for turn flow, including `recovery` and `degraded`.
- Documents search limits tradeoffs in `docs/operations.md`.
- Runs locally with a single verification command and no external credentials.
- Stores project constants and verification metadata in `metadata/project.json`.
- Adds a repository audit script that checks structure before running the language verifier.

## Implementation Notes

The core is a scoring model over demand, capacity, latency, risk, and weight. That keeps position state, move ranking, and turn flow in one explicit decision path. The threshold is 184, with risk penalty 7, latency penalty 3, and weight bonus 3. The Elixir project uses Mix and ExUnit with clear data maps for each scenario.

## Local Setup

Use a normal shell with Elixir available on `PATH`. The verifier is written as a PowerShell script because the portfolio was assembled on Windows.

## Example Scenarios

`examples/extended_cases.csv` adds six named cases. I kept the names plain so failures are easy to read in a terminal: baseline, pressure, surge, degraded, recovery, and boundary.

## Try It

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

This runs the language-level build or test path against the compact fixture set.

## Tests

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/audit.ps1
```

The audit command checks repository structure and README constraints before it delegates to the verifier.

## Roadmap

- Add a loader for `examples/extended_cases.csv` and promote selected cases into the language test suite.
- Add a short report command that prints the score breakdown for a single scenario.
- Add malformed input fixtures so the failure path is as visible as the happy path.
- Add one more chess and game engines fixture that focuses on a malformed or borderline input.

## Boundaries

The fixture set is deliberately small. That keeps the review surface clear, but it also means the model should not be treated as a complete domain simulator.
