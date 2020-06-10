# Auto_Map

A script that you can run in the background!



# Summary

I have created this script because i am preparing for my OSCP exam.
The main goal for this script is to automate scanning  process of recon that is run every time, and instead focus our attention on real pen testing.

This will ensure two things:
1) Automate nmap scans. 

2) Always have some recon running in the background.

Once you find the inital ports in around 10 seconds, you then can start manually looking into those ports, and let the rest run in the background with no interaction from your side whatsoever.

# Features:

1. **Basic TCP:** Shows all open ports quickly (~15 seconds)
2. **Full TCP:** Runs a full range port scan, then runs a thorough scan on new ports (~5-8 minutes)
3. **Basic UDP:** Runs "Basic" on UDP ports (~5 minutes)
4. **Full UDP :** Runs "Full UDP " scan "if not yet run", (~5-10 minutes)
5. **All:** Runs all the scans consecutively (~10-15 minutes)

I tried to make the script as efficient as possible, so that you would get the results as fast as possible, without duplicating any work.

Feel free to send your pull requests and contributions :)

# Installation:

```
- git clone https://github.com/3xTpA/Auto-Map
- cd Auto-Map
- ./gitscanner.sh
```



# Examples of use:

<video src="/root/Videos/Screencast 2020-06-10 03:57:24.mp4"></video>

## **The Result** 

<video src="/root/Videos/Screencast 2020-06-10 03:58:29.mp4"></video>



**If you want to use it anywhere on the system, create a shortcut using:**
`ln -s /PATH-TO-FOLDER/Auto_Map.sh /usr/local/bin/`

- Special thanks to Hightech <https://github.com/HightechSec> for inspiration
- Special thanks to 21y4d <https://github.com/21y4d>
