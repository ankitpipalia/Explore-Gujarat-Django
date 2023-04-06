# Gujarat Explore
This is a website built using Django, MySQL, Nginx as a reverse proxy, and Docker to provide information about travel places in the state of Gujarat, India.
___

### Installation and Setup
1. Clone the repository
```
git clone https://github.com/ankitpipalia/Explore-Gujarat-Django.git
```

2. Build the Docker image 
```
docker build -t gujarat-explore .
```

3. Run the Docker container
```
docker run -p 80:80 gujarat-explore
```

4. Access the website
Visit http://localhost:80 in your web browser to access the website.

### Features
The Gujarat Explore website provides the following features:
+ View a list of travel places in Gujarat
+ View the details of a particular travel place, including its name, description, images, and google maps location
+ User authentication (login and logout)

### Technologies Used
+ Django
+ MySQL
+ Nginx
+ Docker
+ HTML
+ CSS
+ JavaScript

### Images
![homepage1](https://github.com/ankitpipalia/Explore-Gujarat-Django/blob/master/template/img/homepage.png)
![homepage1](https://github.com/ankitpipalia/Explore-Gujarat-Django/blob/master/template/img/homepage2.png)
