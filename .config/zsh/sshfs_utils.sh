#!/usr/bin/env bash

# Path: .config/zsh/sshfs_utils.sh


#source /Volumes/meouch/home/${USER}/private.env
mf_mounts="$HOME/.config/zsh/macfuse_mounts.ishfs"
remotes="$HOME/.config/zsh/sshfs_remotes"
mounts_v="$(mount | rg -Pe "(?:)(.Vol)(.*?)(?=\s\(macfuse)" -o)"

# Regex to match where macfuse volumes are mounted and only print the matches
# Saves the output to a file
# mount > /dev/null 2>&1 | rg -Pe "(?:)(.Vol)(.*?)(?=\s\(macfuse)" -o > macfusemounts.tmp > /dev/null 2>&1

ishfs() {
    if [ -z "$1" ]; then
        cat "${mf_mounts}"
    fi
    if [ "$1" == "save" ]; then
        save && cat "${mf_mounts}" && printf "\nSaved to ${mf_mounts}\n" 
    else
        for i in "$@"; do
            echo "$mounts_v" | rg $i > /dev/null 2>&1; echo $?
        done
    fi
}

save() {
    echo "$(mount | rg -Pe "(?:)(.Vol)(.*?)(?=\s\(macfuse)" -o)" > "${mf_mounts}"
}

mountr() {
    if [ -z "$1" ]; then
        if [[ -s "${remotes}" ]]; then
            while read -r line; do
                remote="$(cut -d' ' -f1 <<<"${line}")"
                local="$(cut -d' ' -f2 <<<"${line}")"
                if [[ $(ishfs ${local}) -eq 1 ]]; then
                    echo "Mounting ${remote} to ${local}"
                    sshfs ${remote} ${local}
                else
                    echo "${remote} is already mounted to ${local}"
                fi
            done < "$remotes"
            save
        else
            echo "No remotes found in ${remotes}"
        fi
    else
        echo "Invalid argument."
    fi
}

umountr() {
    if [ -z "$1" ]; then
        if [[ -s "${remotes}" ]]; then
            while read -r line; do
                remote="$(cut -d' ' -f1 <<<"${line}")"
                local="$(cut -d' ' -f2 <<<"${line}")"
                if [[ $(ishfs ${local}) -eq 0 ]]; then
                    echo "Unmounting ${local} from ${remote}"
                    umount ${local}
                else
                    echo "${remote} is not mounted."
                fi
            done < "$remotes"
            save
        else
            echo "No remotes found in ${remotes}"
        fi
    else
        echo "Invalid argument."
    fi
}

"$@"