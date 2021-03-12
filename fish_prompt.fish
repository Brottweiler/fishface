# name: FishFace

set fish_git_dirty_color red
set fish_git_not_dirty_color green

function _git_branch_name
	echo (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
	echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end

function parse_git_branch
	set -l branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
	set -l git_status (git status -s)

	if test -n "$git_status"
		echo (set_color $fish_git_dirty_color)$branch(set_color normal)
	else
		echo (set_color $fish_git_not_dirty_color)$branch(set_color normal)
	end
end

function fish_prompt
	set -l blue (set_color -o blue)
	set -l green (set_color -o green)
	set -l red (set_color -o red)

	if [ (_git_branch_name) ]
		if [ (_is_git_dirty) ]
			echo -n -s "$red><(((\"> "
		else
			echo -n -s "$green><(((\"> "
		end
	else
		echo -n -s "$blue><(((\"> "
	end
end

function fish_right_prompt
	set -l git_dir (git rev-parse --git-dir 2> /dev/null)

	if test -n "$git_dir"
		set_color normal
		set_color blue
		echo -n -s (prompt_pwd) " " (parse_git_branch) " "
		set_color normal
	else
		set_color normal
		set_color blue
		echo -n -s (prompt_pwd) " "
		set_color normal
	end
end
