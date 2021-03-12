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
