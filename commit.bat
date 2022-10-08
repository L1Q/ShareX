git add *.uk.resx tree.txt commit.bat update.bat rebase.bat
git diff --compact-summary --staged
echo Unstaged:
git diff --compact-summary
pause
git commit --amend -C 41d31caa56f03cd288588e89a453af70eb94f85a
git push -f
pause