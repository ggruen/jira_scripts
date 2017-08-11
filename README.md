jira_scripts
============

Handy command-line access to JIRA issues

Installation
============

Quick Start
-----------

- cpan install JIRA::REST
- Download or clone this repo
- Add the path to `jira_scripts` to your $PATH

Put your JIRA credentials in ~/.netrc (replacing letters in all caps with
appropriate values):

    echo "MY_INSTANCE.atlassian.net login USERNAME password PASSWORD" > \
        ~/.netrc ; chmod 600 ~/.netrc

To get your JIRA username, go to
"https://MYINSTANCE.atlassian.net/secure/ViewProfile.jspa" (replacing
MYINSTANCE with the name of your JIRA instance) and look at the "Username"
field in the "JIRA profile" section.  Your username is *not* the email address
that you use to log in.  This tends to confuse people using API-based programs.

Optional: Install in ~/bin and ~/man
------------------------------------

This will install the scripts in ~/bin and man pages in ~/man.

    cd /path/to/jira_scripts
    make install
    make clean

Add to login script (`.bashrc`, `.bash_profile`, `.profile`)

    export PATH=$PATH:$HOME/bin
    export MANPATH=$MANPATH:$HOME/man

    man get_jira_issue

Tada, man page.

You can also take the path to the `jira_scripts` directory out of your PATH
if you added it earlier.

Usage
=====

`get_jira_issue` - Fetch and display info and comments from a JRIA issue

    get_jira_issue -m machine_name -i issue_code

`update_issue_status` - Transition a JIRA issue to a new status

    update_issue_status -m myinstance.atlassian.net -i jira_code \
        -t transition_id

`update_issue` - Update assignee and comment in a JIRA issue

    update_issue -m machine_name -i issue_code [-c comment | -f comment_file ]
       [ -a assignee_username ]

`update_comments` - Post comments and assign issues based on files in a
Jira Comments dir

    update_comments [-q] [-s scan_dir] [-p processed_dir]

`edit_jira_comment` - Create a comment for `update_comments` to post later

    edit_jira_comment [-s save_dir] [-a assignee] jira_code

Updating
========

    git pull

If you installed it in ~/bin and ~/man:

    make install
    make clean

If you don't have the initial repository cloned, downloaded a zip, etc, you can
just clone or re-download it. All `make` does is copy the scripts to ~/bin, run
`pod2man` on them, and put the man pages into ~/man/man1.
