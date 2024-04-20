#!/bin/bash

return_path=$(pwd)
cd $(dirname "$0")
cd ./installations
this_path=$(pwd)
cd ../../../builds
target_path=$(pwd)

function remove_files() {
	echo "<<< Uninstalling for $1"
	local from=$1
	local to=$2
	cd $from
	
	# Get file labels
	if [[ -f .fl ]]; then
		local files=$(cat .fl)
	else
		echo "[FAILED] The labels list file was not found in $from"
		local files=''
	fi
	if [[ $files == '' ]]; then
		echo "[WARNING] No file labels in $from"
	fi
	# Get dir labels
	if [[ -f .dl ]]; then
		local dirs=$(cat .dl)
	else
		echo "[FAILED] The labels list dir was not found in $from"
		local dirs=''
	fi
	if [[ $dirs == '' ]]; then
		echo "[WARNING] No dir labels in $from"
	fi
	
	# Flipping file labels
	for (( i = 1 ; ; i++ )); do
		local file=$(echo $files | cut -d ' ' -s -f $i)
		
		# Exit condition
		if [[ $file == ''  ]]; then
			if [[ $files == '' ]] || [[ $i > 1 ]]; then
				break;
			else
				file=$files
			fi
		fi
		
		# Uninstall file
		local fullname="$to"/"$file"
		if [[ -f "$fullname" ]]; then
			echo "[SUCCESS] $file was uninstalled from $to"
			rm $fullname
		else
			echo "[FAILED] $fullname is not exist"
		fi
	done
	
	# Flipping dir labels
	for (( i = 1 ; ; i++ )); do
		local dir=$(echo $dirs | cut -d ' ' -s -f $i)
		
		# Exit condition
		if [[ $dir == ''  ]]; then
			if [[ $dirs == '' ]] || [[ $i > 1 ]]; then
				break;
			else
				dir=$dirs
			fi
		fi
		
		# Recursive uninstall dirs
		local fullname="$to"/"$dir"
		if [[ -d "$fullname" ]]; then
			remove_files "$from"/"$dir" $fullname
			if [ "$(ls -A $fullname)" ]; then
				echo "[WARNING] $dir wasn't uninstalled from $to because it's not empty"
			else
				echo "[SUCCESS] $dir was uninstalled from $to"
				rm -r $fullname
			fi
			cd $from
		else
			echo "[FAILED] $fullname is not exist"
		fi
	done
	
	# Clean labels
	> .fl
	> .dl
	echo ">>> End"
}

remove_files $this_path/bin $target_path/bin
remove_files $this_path/include $target_path/include
remove_files $this_path/lib $target_path/lib
remove_files $this_path/share $target_path/share

cd $this_path
cd ../
touch ./.isinstalled
echo "false" > ./.isinstalled

cd $return_path
