# Processes in Linux

## Commands

`ps aux`
- This command displays information such as the PID for processes running on the system.

`top`
- SHIFT + P: Sorts by cpu usage.
- SHIFT + M: Sorts by memory.
- SHIFT + N: Sorts by newest.

`sleep 300`
- Occupys your terminal for a specified number of milleseconds.
  - Use `sleep 300 &` to run it in the background.

`kill -15 PID`
The default value to kill as task is -15

`kill -9 PID` 
This is the harshest possible way to kill a task. (Known as a brute force kill)

## Parent processes and Child processes
- Parent proces will control a child process
- All will have a unique process ID.
- If you forcibly kill a parent process and child process remains, the child processes could become zombie processes and use up resources for no reason.
- Use process manager to kill processes to stop parent from restarting the child.