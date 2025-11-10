---
title: toy's Standardised Versioning
updated: 2025-05-23
---

After seven years or so of releasing software, I felt it was time to address a
common problem in my personal programming style: the lack of a consistent
versioning standard.

The most common standard for a single versioning system is [Semantic
Versioning](https://semver.org/). Overall, it's pretty good, but it has one main
drawback: it is designed exclusively for APIs. I'm a desktop dev at heart, and
my stuff doesn't have dependent software packages. So, for years, I've been
ad-libbing my versioning system from project to project; every time I switched
between projects I'd need to check the convention I had set in place before,
which quickly gets annoying.

I have a couple goals for my new standard:

1. **Be stricter and more concise than SemVer:** SemVer has strings that get
   appended to version numbers like `-alpha+001`.[^1] I want to limit the number
   of characters in general use and over-simplify version strings, whilst still
   maintaining the possibility to represent things like preview releases and
   alphas and betas.
2. **Establish a strict and consistent standard for myself:** I want something
   with a clear and concise reference that not only I, but anyone else can cite
   in their own projects as a concrete system to use..

…And so, I present you with:

## toy's Standardised Versioning v1.0
{:style="text-align:center"}
<small style="display:block; text-align:center">(Working Title)</small>
<p style="text-align:center" markdown="1">
	**Format:**
	`<channel><major>.<minor>[.<patch>][hotfix|rc]`
</p>

* **`<channel>`:** By "channel," I'm referring to whether your software is in
  alpha, beta, or is the full production release
	* **Alpha (`a`)** is the unstable version of your software, when you're
	  still working on adding all the features
	* ***Beta (`b`)** is when all functionality is there, and bug-fixing/testing
	  takes place. Some small final tweaks to functionality get made
	* ***Release (`v`)** is the production copy of your software
* **`<major>`:** The major version is ≥1 (never 0), and increments when you do
  refactoring that changes the underlying algorithms behind your program's
  functionality. It is also for **breaking changes**, such as dropping an old
  config file format without providing automatic migration to the new format in
  your code
* **`<minor>`:** The minor version starts at 0 when the major version
  increments, and increments when you release batches of new features and
  bugfixes ("feature updates"). A minor update **cannot** be bugfix-only
* **`[patch]`:** The patch number starts at 0 for every minor increment, and
  increments when you release bugfixes consolidated into one rollup patch
  update. They _ideally_ shouldn't change functionality at all
* The final part of the version is two mutually exclusive options:
	* **`[hotfix]`:** A hotfix is a small **bugfix-only** update that contains
	  fixes for **critical** bugs in the latest release of your production
	  software. This means they _shouldn't_ contain regular bugfixes for
	  non-critical stuff; non-critical fixes should be rolled up into _patch_
	  versions. The hotfix number is padded with zeroes to be two digits long
	  and is appended to the latest version with an underscore, _e.g:_ `_01`.
	  Because this is a standard, I should specify that hot fix numbers >2
	  digits are written without any padding, e.g. `_99`, `_100`, `_101`, ….
	  However, it is my opinion as a programmer that you should never touch a
	  computer again and/or have your hands chopped off of you need to ship **a
	  hundred** <u>urgent</u> singular bugfixes consecutively
	* **`[rc]`:** Release candidates are for the preview/beta channel of your
	  software **only**, and should not have hotfix updates shipped for them—as
	  the user knowingly accepts that a release candidate version is inherently
	  an unstable preview version. The number for RCs starts at 1 and increments
	  indefinitely until the production release arrives. _e.g:_ The first beta
	  build of `v1.2`, based on `v1.1`'s codebase, is `v1.2-rc1`. Whilst you're
	  releasing RC pre-releases, you can still update your production releases:
	  <img src="/media/blog/2024/06-17_versioning/rc-branching.png" class="fcenter" width="75%">
	  Due to a release candidate's nature as a rapid prototype, it won't _need_
	  patch or hotfix versions because—functionally—whenever you'd normally ship
	  one of those, on the preview branch, you'd just ship a release candidate
	  instead

### Example Valid Version Numbers
`a1.0` → `a1.1` → `b1.0` → `b1.0.1` → `v1.0` → `v1.1` → `v1.1_01` → `v1.2-rc1`
and `v1.1.1` (based on the same prior release) → `v1.2`

[^1]: ["Semantic Versioning 2.0.0"](https://semver.org/). Preston-Werner, T.
