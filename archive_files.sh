<<comment
Archive older files or larger files

Steps:
1) Provide path of Directory
2) Check if directory is present or not
3) Create archive folder if not present
4) Find all files with size more than 20kb
5) Compress each file
7) Make a cron job to run everyday at given time
comment


path=/home/linux
days=10
depth=1
run=0

#check if directory exists  or not

if [[ ! -d $path ]]
then
	echo "Directory does not exists!! : $path"
	exit 1
fi

# check if archive folder is present or not, if not preset create it

if [[ ! -d $path/archive ]]
then
	mkdir $path/archive
fi

#find all the files greater than 20MB


for file in `find $path -maxdepth $depth -type f -size +20M`
do
	if [[ $run -eq 0 ]]
	then
		gzip $file || exit 1
		mv $file.gz $path/archive || exit 1
	fi
done


#find all the files older than 30days

for file in `find $path -maxdepth $depth -type f -mtime +30`
do
        if [[ $run -eq 0 ]]
        then
                gzip $file || exit 1
                mv $file.gz $path/archive || exit 1
        fi
done

