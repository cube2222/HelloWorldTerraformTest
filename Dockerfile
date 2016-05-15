FROM golang:1.6.2

RUN mkdir /home/HelloWorldTerraformTest
RUN git clone https://github.com/cube2222/HelloWorldTerraformTest.git /home/HelloWorldTerraformTest
RUN cd /home/HelloWorldTerraformTest && go get -d
RUN cd /home/HelloWorldTerraformTest && go build
EXPOSE 80

ENTRYPOINT /home/HelloWorldTerraformTest/HelloWorldTerraformTest