SCRIPTS = \
    update_issue_status \
    update_issue \
    update_comments \
    edit_jira_comment \
    get_jira_issue

# Scripts are documented with POD (either as a here doc in shell scripts or as
# POD in perl scripts).
# We assume any file with a line starting with "=head1" has POD we need to
# extract.
HAS_POD = $(shell egrep -l '^=head1 ' $(SCRIPTS))

MAN = $(patsubst %, %.1, $(HAS_POD))

all: $(MAN) $(SCRIPTS)

%.1 : %
	pod2man $< > $@

install: all
	install -d $(HOME)/man/man1 ; \
	install -d $(HOME)/bin ; \
	install -m 444 $(MAN) $(HOME)/man/man1 ; \
	install -m 500 $(SCRIPTS) $(HOME)/bin ;

clean:
	rm $(MAN)
