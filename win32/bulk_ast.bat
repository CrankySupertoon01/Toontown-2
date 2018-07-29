@echo off
echo ===============================
echo Starting Toontown 2 Astron cluster...
echo ===============================
cd "dependencies/astron/"

astrond --loglevel info config/cluster.yml
pause
