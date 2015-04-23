# Auto-update-CRZZ-IP-libs
Update IP libraries from CRZZ weekly by shell and php script

1. Adjust the 'path' variable, the excutable bin path of php in updateip.sh;  Make updateip.sh excutable by chown/chmod.


2. Place updateipfile.php in the same path you set in step 1; Also change the $source_path and $target_path in updateipfile.php as desired.


3. Add the script to the Cron job. Such as in Ubuntu type in terminal:

        crontab -e

    Add the cron job making it excute at 5:00 in the morning every saturday (6 for saturday,among 0-6)

        0 5 * * 6 sh /home/harry/Desktop/tmp/updateip.sh
    
    Save and exit,show the crontab:

        crontab -l

    That's All.

