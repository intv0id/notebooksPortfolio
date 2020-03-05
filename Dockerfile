FROM continuumio/miniconda3

LABEL "com.github.actions.name"="Notebook portfolio generator"
LABEL "com.github.actions.description"="Generates a portfolio from the notebooks of a github repository"
LABEL "com.github.actions.icon"="mic"
LABEL "com.github.actions.color"="purple"

LABEL "repository"="http://github.com/intv0id/notebooksPortfolio"
LABEL "homepage"="http://github.com/actions"
LABEL "maintainer"="Clément Trassoudaine <clement.trassoudaine@eurecom.fr>"

CMD ./setup.sh

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]