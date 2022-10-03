git init -b main
git add . && git commit -m "First commit"
gh repo create test_workflow7 --public
git remote add origin https://github.com/Mikhil11/test_workflow7.git
git remote -v
git push origin main
