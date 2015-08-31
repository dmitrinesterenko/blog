FROM marcelocg/phoenix

#VOLUME "/home/dmitri/workspace/blog_phoenix":"/my_phoenix"
ENV WORKDIR /my_phoenix
WORKDIR $WORKDIR
ADD . $WORKDIR
#RUN "npm install"
#RUN "mix phoenix.server"
EXPOSE 4000
