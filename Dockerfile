FROM ckulka/rhodecode-rccontrol
LABEL maintainer="cyrill.kulka@gmail.com"

ENV RC_APP		Community
ENV RC_VERSION	4.9.0

# Install RhodeCode Community Edition
RUN .rccontrol-profile/bin/rccontrol	\
		install $RC_APP					\
		--version $RC_VERSION			\
		--accept-license				\
		'{"host": "0.0.0.0", "port": 5000, "username": "admin", "password": "ilovecookies", "email": "adalovelace@example.com", "repo_dir": "/data", "database": "sqlite"}'

EXPOSE 5000
CMD ./start.sh
