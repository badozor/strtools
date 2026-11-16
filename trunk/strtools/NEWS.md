# strtools 1.0.1 (2026-11-15)

Maintenance release. The code of version 1.0 (2011) is kept; only the
changes needed to run under current R and ade4 were made.

## Bug fixes

* `EVindex(x)` failed when `y = NULL` (`as.matrix(NULL)` is an error in
  recent R). The check of negative values now applies to `y` too.
* `simSIM4.marker()` called `ade4::as.rtest()`, which no longer exists.
  It now uses `ade4::as.randtest()`.
* `recode.STR1col()` and `recode.STR2col()`: partial argument
  `level =` replaced by `levels =` in `factor()`.

## Package infrastructure

* Package moved to the root of the repository; old build scripts,
  source tarball and manual moved to `legacy/`.
* Added `NAMESPACE`, `inst/CITATION`, `README.md` and `NEWS.md`.
* License changed from "GPL version 2 or newer" to GPL-3, to match the
  `LICENSE` file of the repository.
* Hexagonal logo added in `logo/`.
* `DESCRIPTION` updated (`Authors@R`, `License: GPL-3`,
  `LazyData`, `Encoding: UTF-8`).

## Documentation

* All help pages completed, with runnable examples.
* New help pages for `genocell2tab()`, `GliomaCL` and `NCI60`.
* Help page of the cleaning helpers now documents the exported names
  `REbracketout()`, `REspaceout()` and `REzeroout()`.
* Usage of `simSIM.marker()` and default values of `simSIM4.marker()`
  aligned with the code.
* References to Bady et al. (2012) and Masters et al. (2001) added.

# strtools 1.0 (2011-02-06)

* First version (Google Code SVN, then git).
