# raster-move-endgame-mark

`raster-move-endgame-mark` explores chess and game engines with a small Elixir codebase and local fixtures. The technical goal is to build an Elixir toolkit that studies endgame behavior through transition tables, with invalid-transition tests and offline replay mode.

## Reason For The Project

The project exists to keep a narrow engineering decision visible and testable. For this repo, that decision is how position pressure and search width should influence a review result.

## Raster Move Endgame Mark Review Notes

`recovery` and `stale` are the cases worth reading first. They show the optimistic and cautious ends of the fixture.

## What It Does

- `fixtures/domain_review.csv` adds cases for position pressure and move ordering.
- `metadata/domain-review.json` records the same cases in structured form.
- `config/review-profile.json` captures the read order and the two review questions.
- `examples/raster-move-endgame-walkthrough.md` walks through the case spread.
- The Elixir code includes a review path for `endgame risk` and `position pressure`.
- `docs/field-notes.md` explains the strongest and weakest cases.

## How It Is Put Together

The repository has two validation layers: the original compact policy fixture and the domain review fixture. They are separate so one can change without hiding failures in the other.

The Elixir code keeps the review rule close to the tests.

## Run It

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

## Check It

The same command runs the local verification path. The highest-scoring domain case is `recovery` at 214, which lands in `ship`. The most cautious case is `stale` at 117, which lands in `watch`.

## Boundaries

The repository is intentionally scoped to local checks. I would expand it by adding adversarial fixtures before adding features.
