FROM nginx:latest
COPY /home/ec2-user/Project2/index.html /usr/share/nginx/html/
EXPOSE 8000
CMD ["nginx","-g","daemon off;"]
