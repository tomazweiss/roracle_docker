# Adding ROracle package to rocker/tidyverse Docker image

ROracle is an open source R package supporting a DBI-compliant Oracle driver based on the high performance OCI library. It enables highly scalable and performant connectivity to Oracle Database for data transfer.
The installation of this package, however, can be a bit challenging. 

This repo provides a Dockerfile, based on the rocker/tidyverse image, that adds ROracle package.
A similar script can be used to add this package to a non-dockerized Ubuntu installation.

Before building the image, the user should create a subfolder `oracle` with the following files:
- oracle-instantclient-basiclite-21.13.0.0.0-1.el8.x86_64.rpm
- oracle-instantclient-devel-21.13.0.0.0-1.el8.x86_64.rpm
- ROracle_1.4-1_R_x86_64-unknown-linux-gnu.tar.gz

These files can be downloaded from:
- https://www.oracle.com/database/technologies/instant-client/linux-x86-64-downloads.html
- https://www.oracle.com/database/technologies/roracle-downloads.html

A free Oracle account may be required for access.
Depending on your Oracle in R installations, different package versions may be needed.
