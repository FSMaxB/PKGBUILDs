PKGBUILDs
=========

How to update AUR packages
--------------------------
1. `git subtree pull --prefix AUR/<package> <package> master`
2. Update the package and commit
3. `git subtree push --prefix AUR/<package> <package> master`
