### Project #4
Make a "system profiler tool". It's a shell script that you can copy to a Linux system and it'll dump the results of a simple system summary to the screen.
* Make your script, name it 'profilerTool.sh'
* Have it gather this information and print it out to the screen. Separate each piece with a nice line of asterisks to tell when tools start and stop.
    - Hostname
    - Kernel version
    - Uptime
    - Memory available
    - Quantity of users - check in passwd, filter for those that can login
    - Who is currently logged in
    - Find the top 3 memory using processes (ps aux | grep -v USER | sort -nk +4 | tail -n 3)
    - List of block devices (drives)
    - Current system load