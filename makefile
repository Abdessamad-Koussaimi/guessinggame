.PHONY: all FORCE

all: README.md

README.md: guessinggame.sh makefile FORCE
	@{ \
		echo "---"; \
		echo "layout: default"; \
		echo "title: Guessing Game"; \
		echo "permalink: /"; \
		echo "---"; \
		echo; \
		echo "# Guessing Game"; \
		echo; \
		echo "Generated: $$(date '+%Y-%m-%d %H:%M:%S %Z')"; \
		echo "Lines of code: $$(wc -l < guessinggame.sh | tr -d ' ')"; \
	} > README.md

FORCE:
