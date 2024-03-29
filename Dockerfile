FROM rocker/tidyverse:4.0.5

LABEL purpose="Add ROracle package to rocker/tidyverse"

ENV USER rstudio

WORKDIR /home/rstudio/workspace

COPY . .

RUN sudo apt-get update -y
RUN sudo apt-get install alien libaio1 -y

## download rpms from https://www.oracle.com/database/technologies/instant-client/linux-x86-64-downloads.html
RUN sudo alien -i oracle/oracle-instantclient-basiclite-21.13.0.0.0-1.el8.x86_64.rpm
RUN sudo alien -i oracle/oracle-instantclient-devel-21.13.0.0.0-1.el8.x86_64.rpm

RUN sudo sh -c  'echo /usr/lib/oracle/21/client64/lib/ > /etc/ld.so.conf.d/oracle.conf'

ENV LD_LIBRARY_PATH=/usr/lib/oracle/21/client64/lib/${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}

## download tar.gz from https://www.oracle.com/database/technologies/roracle-downloads.html
RUN R CMD INSTALL --configure-args='--with-oci-lib=/usr/lib/oracle/21/client64/lib --with-oci-inc=/usr/include/oracle/21/client64'  oracle/ROracle_1.4-1_R_x86_64-unknown-linux-gnu.tar.gz

