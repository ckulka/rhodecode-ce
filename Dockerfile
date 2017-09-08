FROM ckulka/rhodecode-rccontrol
LABEL maintainer="cyrill.kulka@gmail.com"

ENV RC_APP		Community
ENV RC_VERSION	4.9.0

ENV RC_USER		admin
ENV RC_PASSWORD	ilovecookies
ENV	RC_EMAIL	adalovelace@example.com
ENV RC_DB		postgresql://postgres:secret@db

USER root
RUN mkdir -m 0755 /data && chown rhodecode:rhodecode /data
USER rhodecode

# Cache RhodeCode Community by installing & removing it
RUN .rccontrol-profile/bin/rccontrol	\
		install Community				\
		--version $RC_VERSION			\
		--accept-license				\
		'{"host": "0.0.0.0", "port": 8080, "username": "RC_USER", "password": "RC_PASSWORD", "email": "RC_EMAIL@example.com", "repo_dir": "/data", "database": "sqlite"}' \
	&& .rccontrol-profile/bin/rccontrol uninstall community-1

EXPOSE 8080
CMD bash start.sh
