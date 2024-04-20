#!/bin/bash

return_path=$(pwd)
cd $(dirname "$0")
cd ./installations
this_path=$(pwd)
cd ../../../builds
target_path=$(pwd)

function move_files() {
	echo "<<< Installing from $1"
	local from=$1
	local to=$2
	cd $from
	touch .fl .dl
	> .fl
	> .dl
	for fullname in "$from"/*; do
		local filename="${fullname##*/}"
		if [[ "$filename" == .fl ]]; then
			continue
		elif [[ "$filename" == .dl ]]; then
			continue
		elif [[ -d "$fullname" ]]; then
			mkdir -p $to/$filename
			echo "$filename" >> .dl
			move_files $fullname $to/$filename
			cd $from
			echo "[SUCCESS] $filename was installed to $to"
		elif [[ -f "$fullname" ]]; then
			echo "[SUCCESS] $filename was installed to $to"
			echo "$filename" >> .fl
			cp $fullname $to
		else
			echo "[FAILED] $fullname is not valid"
		fi
	done
	echo ">>> End"
}

move_files $this_path/bin $target_path/bin
move_files $this_path/include $target_path/include
move_files $this_path/lib $target_path/lib
move_files $this_path/share $target_path/share

cd $this_path
cd ../
touch ./.isinstalled
echo "true" > ./.isinstalled

cd $return_path
