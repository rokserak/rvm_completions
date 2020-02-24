# fish shell completions for RVM

# script generated
complete -f -c rvm -n '__fish_use_subcommand' -a fetch -d "download binary or sources for selected ruby version"
complete -f -c rvm -n '__fish_use_subcommand' -a install -d "install ruby interpreter"
complete -f -c rvm -n '__fish_use_subcommand' -a list -d "show currently installed ruby interpreters, list known for available interpreters"
complete -f -c rvm -n '__fish_use_subcommand' -a mount -d "install ruby from external locations"
complete -f -c rvm -n '__fish_use_subcommand' -a patchset -d "tools related to managing ruby patchsets"
complete -f -c rvm -n '__fish_use_subcommand' -a pkg -d "install a dependency package"
complete -f -c rvm -n '__fish_use_subcommand' -a reinstall -d "reinstall ruby and run gem pristine on all gems"
complete -f -c rvm -n '__fish_use_subcommand' -a remove -d "remove ruby and downloaded sources"
complete -f -c rvm -n '__fish_use_subcommand' -a requirements -d "installs dependencies for building ruby"
complete -f -c rvm -n '__fish_use_subcommand' -a uninstall -d "uninstall ruby, keeping it's sources"
complete -f -c rvm -n '__fish_use_subcommand' -a upgrade -d "upgrade to another ruby version, migrating gems"
complete -f -c rvm -n '__fish_use_subcommand' -a current -d "print current ruby version and name of used gemsets"
complete -f -c rvm -n '__fish_use_subcommand' -a do -d "runs a command against specified and/or all rubies"
complete -f -c rvm -n '__fish_use_subcommand' -a gemdir -d "display path to current gem directory ($GEM_HOME)"
complete -f -c rvm -n '__fish_use_subcommand' -a use -d "switch to given (and already installed) ruby version, default or system"
complete -f -c rvm -n '__fish_use_subcommand' -a wrapper -d "creates wrapper executables for a given ruby & gemset"
complete -f -c rvm -n '__fish_use_subcommand' -a gemset -d "manage gemsets"
complete -f -c rvm -n '__fish_use_subcommand' -a migrate -d "migrate all gemsets from one ruby to another"
complete -f -c rvm -n '__fish_use_subcommand' -a alias -d "define aliases for `rvm use`"
complete -f -c rvm -n '__fish_use_subcommand' -a autolibs -d "tweak settings for installing dependencies automatically"
complete -f -c rvm -n '__fish_use_subcommand' -a group -d "tools for managing groups in multiuser installations"
complete -f -c rvm -n '__fish_use_subcommand' -a rvmrc -d "tools related to managing .rvmrc trust & loading gemsets"
complete -f -c rvm -n '__fish_use_subcommand' -a implode -d "removes the rvm installation completely"
complete -f -c rvm -n '__fish_use_subcommand' -a cleanup -d "remove stale source files & data associated with rvm"
complete -f -c rvm -n '__fish_use_subcommand' -a cron -d "manage setup for using ruby in cron"
complete -f -c rvm -n '__fish_use_subcommand' -a docs -d "tools to make installing ri and rdoc docs easier"
complete -f -c rvm -n '__fish_use_subcommand' -a get -d "upgrades RVM to latest head, stable or branched version"
complete -f -c rvm -n '__fish_use_subcommand' -a osx-ssl-certs -d "helps update OpenSSL certs installed by rvm on OS X"
complete -f -c rvm -n '__fish_use_subcommand' -a reload -d "reload rvm source itself"
complete -f -c rvm -n '__fish_use_subcommand' -a reset -d "remove all default and system settings"
complete -f -c rvm -n '__fish_use_subcommand' -a snapshot -d "backup/restore rvm installation"
complete -f -c rvm -n '__fish_use_subcommand' -a config-get -d "display values for RbConfig::CONFIG variables"
complete -f -c rvm -n '__fish_use_subcommand' -a debug -d "additional information helping to discover issues"
complete -f -c rvm -n '__fish_use_subcommand' -a export -d "set temporary env variable in the current shell"
complete -f -c rvm -n '__fish_use_subcommand' -a fix-permissions -d "repairs broken permissions"
complete -f -c rvm -n '__fish_use_subcommand' -a repair -d "lets you repair parts of your environment, such as wrappers, env files and similar (general maintenance)"
complete -f -c rvm -n '__fish_use_subcommand' -a rubygems -d "switches version of rubygems for the current ruby"
complete -f -c rvm -n '__fish_use_subcommand' -a tools -d "general information about the ruby env"
complete -f -c rvm -n '__fish_use_subcommand' -a unexport -d "undo changes made to the environment by `rvm export`"
complete -f -c rvm -n '__fish_use_subcommand' -a user -d "tools for managing RVM mixed mode in multiuser installs"
complete -f -c rvm -n '__fish_use_subcommand' -a info -d "show the environment information for current ruby"
complete -f -c rvm -n '__fish_use_subcommand' -a disk-usage -d "display disk space occupied by rvm"
complete -f -c rvm -n '__fish_use_subcommand' -a notes -d "display notes with operating system specifics"
complete -f -c rvm -n '__fish_use_subcommand' -a version -d "display rvm version (equal to `rvm -v`)"

# hand written

function __get_envs
	ls ~/.rvm/environments/ | tr '' '@'
end

for env in "(__get_envs) system"
	complete -c rvm -n '__fish_using_command rvm use' -f -a "$env"
end

for comm in copy create delete dir empty export gemdir globalcache import install list list_all name pristine rename unpack update use
	complete -c rvm -n '__fish_using_command rvm gemset' -f -a "$comm"
end

function __fish_using_command
    set cmd (commandline -opc)
    if [ (count $cmd) -eq (count $argv) ]
        for i in (seq (count $argv))
            if [ $cmd[$i] != $argv[$i] ]
                return 1
            end
        end
        return 0
    end
    return 1
end

for env in "(__get_envs)"
	complete -c rvm -n '__fish_using_command rvm gemset use' -f -a "$env"
	complete -c rvm -n '__fish_using_command rvm gemset delete' -f -a "$env"
end
