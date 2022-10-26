#
#-> turbo system
#-> lsb_release -a
# Showing system name and version details
#
#
#-> systemctl is-enabled name.service
# Check if service is enabled for autoload
#
#
#
#
# PSQL DUMP
# Take snapshot
#-> pg_dump -U username --clear mydatabase_name > dev_17_18_wed_26.sql
#
# Copy from first server to second (current) server (or computer)
#-> scp serhii@134.122.30.250:/home/username/dev_17_18_wed_26.sql /home/username/downloaded_dev_17_18_wed_26.sql
#
# Overwrite existing DB with downloaded snapshot file
#-> psql -U username mydatabase_name < /home/serhii/downloaded_dev_17_18_wed_26.sql
#
