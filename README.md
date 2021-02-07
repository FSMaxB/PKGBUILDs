PKGBUILDs
=========

How to update AUR packages
--------------------------
1. `git subtree pull --prefix AUR/<package> <package> master`
2. Update the package
3. Build with `makepkg`
4. Generate `.SRCINFO` using `makepkg --printsrcinfo > .SRCINFO`
5. Commit.
6. `git subtree push --prefix AUR/<package> <package> master`
