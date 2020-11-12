# Background

If you have a Windows File System, SQL or Consistency Group app you want to perform pre/post tasks on while performing backup you can use this script. The only requirements are:

1)  Actifio Connector must be installed on the host
2)  App must be discovered
3)  The bat file in this repo must be renamed to match the Appliance Application ID, so if the appid is 1566877, then the bat file should be named appid.1566877.bat   
You can use the Appliance CLI command reportapps to display App IDs.
4)  The renamed bat file should be in c:\Program Files\Actifio\Scripts

Effectively the order of events will be:

1)  Actifio Appliance requests the Appliance Connector to run the init tasks in c:\Program Files\Actifio\Scripts\appid.xxxx.bat
2)  Actifio rAppliance equests the Appliance Connector to run the freeze tasks in c:\Program Files\Actifio\Scripts\appid.xxxx.bat
3)  Actifio Appliance requests the Appliance Connector to run the thaw tasks in c:\Program Files\Actifio\Scripts\appid.xxxx.bat
4)  Actifio Appliance requests the Appliance Connector to run the fini tasks in in c:\Program Files\Actifio\Scripts\appid.xxxx.bat


# Error handling

The script uses simple error code checking to determine if the exit is clean or dirty.   As written, if the freeze fails, then the snapshot will fail.   This is on the assumption that you do not want a 'fuzzy' image.    


# Renaming the script

The script is called appid.xxxx.bat by default.   You must learn the Appliance Application ID of the file system or ConsistencyGroup app and then rename it.   If the Appliance Application ID is 1566877 then the file name should be appid.1566877.bat
You can use the Appliance CLI command reportapps to display App IDs.   

# Installing the Script

Once the script is customized and named correctly place it in the following location:
```
c:\Program Files\Actifio\Scripts
```

# Testing the Scripts

Open a command prompt using 'Run as Administrator' and run these two commands:
```
cd c:\Program Files\Actifio\Scripts
appid.1566877.bat init
appid.1566877.bat freeze
appid.1566877.bat thaw
appid.1566877.bat fini
```

### Event logging
The script is written so when run manually, all output is echoed to the screen.   When run by the Actifio Connector all output will be logged in the UDSAgent.log file that can be found in C:\Program Files\Actifio\logs\UDSAgent.log
This means if you are debugging events, use this log file.
