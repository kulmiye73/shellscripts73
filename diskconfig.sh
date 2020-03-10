#! /bin/bash
#This script create a report of our disk configuration.

FILENAME=`hostname`
echo -e "Disk report saved to $FILENAME.report"

echo -e "\n LVM Configuration: \n\n" >>FILENAME.report
lvscan >>$FILENAME.report

echo -e "\n\n Partition Configuration: \n\n" >>$FILENAME.report
fdisk -l | head -17 >>$FILENAME.report

echo -e "\n\n Mounted Filesystem: \n\n" >>$FILENAME.report
df -hT | grep -v tmp >>$FILEMNAE.report

echo -e "\n\n RAID Configuration: \n\n" >>$FILENAME.report mdadm --detail /dev/md0 >>$FILENAME.report

