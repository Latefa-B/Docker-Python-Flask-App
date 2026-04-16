# Dockerizing a Simple Dynamic Web Application (Python Flask)
Dockerizing a Simple Web Application involves deploying the Website and its dependencies into a container. This concept of containerization provides several benefits, including : isolation, portability, increased efficiency, an easier scaling and consistency across different environments. 
This comprehensive step-by-step guide walks you through the process of Dockerizing, a dynamic Python Flask web application on AWS. In this lab,  we will explore the foundational steps of containerizing a simple dynamic website, using services like : Docker, Python and Flask framework. The aim of this project is to : 
Learn how to package a simple dynamic website into a lightweight, portable container that can run consistently across any environment. 
- Get familiar with key Docker concepts such as Dockerfiles, images, containers, and port mapping. 
- Learn how to create a simple Python Flask web application.
- Learn how to create a Dockerfile for a Python application.
- How to manage application dependencies using requirements.txt.
- How to build and run a Docker container for a dynamic application.
- Understand how containerization simplifies application deployment and improves scalability and reproducibility. 

## Prerequisites 
In order to proceed, we need to make sure beforehand to : 
- Have Docker installed. 
- Understand Dockerfile and Docker run basics.
- Know how to dockerize a simple static website.
- Be familiar with Python.

## Step-by-Step Instructions : 
### Step 1 : Create Your Dynamic Web Application Files
The dynamic website application consist of : 
- **Python file (app.py)** that runs the web server 
- **HTML template (index.html)** that Python code will use to display the content.
- **requirements.txt file** that tells Docker which Python libraries our application needs. This file lists all the Python libraries our app.py needs to run. Docker will use this to install them inside the container.
To complete Step 1, follow the instructions below : 
- Create a new folder on your computer named my-flask-app.
- Inside my-flask-app, create a subfolder named templates.
- Inside the templates folder, create a new file named index.html.
- Open templates/index.html with a text editor and paste the following content.
<img width="691" height="643" alt="1" src="https://github.com/user-attachments/assets/2d4ba3bd-de71-4c80-9f3d-b769435d5613" />

- Go back to the my-flask-app folder (the parent folder). Create a new file named app.py.
- Open app.py with your text editor and paste the following content.
- In the my-flask-app folder, create a new file named requirements.txt.
- Open requirements.txt and paste the following content.
<img width="720" height="498" alt="2" src="https://github.com/user-attachments/assets/f74b0bab-8713-4d25-9b1a-0b34fdaf0eb1" />

- Save all files. 
<img width="671" height="131" alt="3" src="https://github.com/user-attachments/assets/918ce1d9-098e-4e69-b1f7-dbbe587e2c13" />

### Step 2: Create a Dockerfile for the Flask App
Now that we have configured the Application structure and code, we need to create a Dockerfile to build our Python Flask application's image. We will also set up a Python environment and install our dependencies. To complete Step 2, follow the instructions below: 
- In the my-flask-app folder, create a new file named Dockerfile (no file extension).
- Open Dockerfile and paste the following content.
- Save the Dockerfile.
<img width="738" height="512" alt="4" src="https://github.com/user-attachments/assets/2f8c46ff-492a-4cde-bbf3-b68af88f85b7" />

### Step 3: Build Your Docker Image
Now that you have your Dockerfile and your website files, build your Docker image. To complete Step 3, follow the instructions below: 
- Open your command line or terminal. Navigate to your my-flask-app folder and get inside it.
- Run the following command to build your Docker image: docker build -t my-flask-app .
docker build -t my-flask-app . command tells Docker to read the Dockerfile and create a reusable image.
<img width="1376" height="497" alt="5" src="https://github.com/user-attachments/assets/9067fd46-7def-4edc-838e-2f8aaaed8060" />

- Here is a breakdown of the command : 
**docker build** : This is the command to tell Docker to build an image.
**-t my-flask-app** : We are tagging this image as my-flask-app.
**.** : The dot at the end tells Docker to look for the Dockerfile in the current folder you are in.

**Expected output** : you will see Docker downloading the Python base image, installing Flask, and copying your files. It will be installing Python packages.

- Verify the image was built using the command : docker images. You should see my-flask-app listed in the output. 

### Step 4: Run Your Docker Container
Now that you have built your Docker image, let’s run it ! When you run an image, it becomes a "container." You can run many containers from the same image. We will also tell Docker to connect a port on your computer to the port inside the container so you can access the dynamic website from your web browser. We will map a port on your server to the port our Flask app is listening on, port 5000. To complete Step 4, follow the instructions below : 
- Run the following command in your terminal: docker run -d -p 5000:5000 --name my-flask-website my-flask-app
<img width="1108" height="126" alt="6" src="https://github.com/user-attachments/assets/e50c6cc2-dfa1-4d7d-a197-471b5d40f9c2" />

- Here is a breakdown of the command : 
**docker run** : this command tells Docker to start a new container. 
**-d** : This means "detached mode." It tells Docker to run the container in the background so you can continue using your terminal.
**-p 5000:5000** : This is the port mapping. We are mapping port 5000 on your computer to port 5000 inside the container.
**my-flask-app** : The name of the Docker image we just built.
**expected output** : Docker will output a long string of characters (the container ID), indicating that the container has started.
  
- To check if your container is running, run in your  command line : docker ps. You should see my-flask-website listed in the output. You can also curl the application using the command : curl localhost:5000
<img width="669" height="579" alt="7" src="https://github.com/user-attachments/assets/5abadc2a-cc2e-47f0-a1cb-2cd049dcd9d3" />


- If you are deploying your website from an AWS EC2 instance, before trying to access it from the browser, make sure the security groups of your running instance are properly configured to allow inbound traffic. To configure the security group : 
- On your AWS Console, Go to EC2 Dashboard -> Select your workstation (EC2 instance) -> Go to Security -> Select the security group related to it -> Click on Edit Inbound rules -> Add rules : HTTP Traffic on port 80 from anywhere ; TCP Custom Traffic on port 5000 from anywhere
- Then, Click save rules.
<img width="1404" height="593" alt="8" src="https://github.com/user-attachments/assets/0b00e107-3095-4b4f-ad45-ff02ed88aa83" />


### Step 5: Access Your Dynamic Website
Your dynamic Flask application is now running inside a Docker container, You can access it through your web browser. To complete Step 5, follow the instructions below : 
- Open your web browser, In the address bar, type:  <http://localhost:5000> or <http://EC2-Public-IP:5000> if you have deployed your website on AWS Cloud.
- Press Enter. You should now see your dynamic Flask website, displaying the current time! Refresh the page a few times - to see the time update, proving it's dynamic.
**First screenshot, current time : 05:04:43**
<img width="1411" height="490" alt="9" src="https://github.com/user-attachments/assets/e4c10251-103d-4f71-982f-d4c790b7457c" />

**Second screenshot, current time : 05:07:16**
<img width="1399" height="485" alt="10" src="https://github.com/user-attachments/assets/5482a0f5-923a-447f-99ba-6b451a037f0b" />

### Step 6 : Clean Up 
When you are finished with a container, it's good practice to stop and remove it, and remove the image if you don't need it anymore. This helps keep your computer clean and frees up resources. To complete Step 6, follow the instructions below : 
- Stop the running container using the command : docker stop my-flask-website
- Remove the stopped container using the command : docker rm my-flask-website
- Remove the Docker image (only if you don't need it anymore) using the command : docker rmi my-flask-app
<img width="801" height="281" alt="11" src="https://github.com/user-attachments/assets/5baf0c75-2e6d-4b29-b686-485eace47ed2" />


### Summary
This breakdown provides a step-by-step guide to Dockerize, a dynamic Python Flask web application. By completing this project, we had an overview of how to package a simple dynamic website into a container that can run consistently across any environment: From creating a Dockerfile, to building a Docker image from it, and launching the application inside a container. To finally, access the website from a web browser.

This process highlights how containerization simplifies and automates the process of deploying a dynamic Application like Flask, how it improves scalability, portability and efficiency, but also enhances isolation, consistency and reproducibility. This approach makes Docker a powerful tool for containerizing modern Applications and complex applications in real-world environments, for a fast, reliable and consistent deployment.
