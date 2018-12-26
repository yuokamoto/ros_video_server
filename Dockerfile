FROM ros:kinetic

LABEL authors = "Yu Okamoto <yu.okamoto@rapyuta-robotics.com>"

# install base software
RUN apt-get update && apt-get install --no-install-recommends -y \
	ros-kinetic-web-video-server 

COPY ./web_video_server.launch /
RUN chmod +x /web_video_server.launch
CMD ["roslaunch web_video_server.launch"]

EXPOSE 8080

# add entrypoint
COPY ./ros_entrypoint.sh /
RUN chmod +x /ros_entrypoint.sh
ENTRYPOINT ["/ros_entrypoint.sh"]