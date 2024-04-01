# docker-nuxt-dev-small

# How to create a NUXT-DEV-CONTAINER (from one NUXT-DEV-IMAGE)

## Step 1

1. Create a development Docker container with the minimum Node.js version required for Nuxt, which is version 18 in alpine.
   `docker run -it —rm node:18 sh`
   ![docker](/readme_assets/one1.png)

2. Wait for it to finish when you see this message. Install Nuxt in the environment `npx nuxi@latest init your_name`(select nuxi@3.11.1, yes).Choose your package manager (I use npm).
   ![docker](/readme_assets/one2.png)

3. We do not need a repository since we will only copy the files in another folder, and we will not need this development Docker container later.
   ![docker](/readme_assets/one3.png)

4. Navigate to your folder.

   ![docker](/readme_assets/one4.png)

5. MOST IMPORTANTLY, run `npm i` in this environment, and do not close the terminal, or you will lose everything (development environment only).
   ![docker](/readme_assets/one5.png)

## Step 2

1. Open another terminal without closing the previous one, navigate to the location where you want to develop your project. Find the ID of the container created in the first terminal using docker ps
   ![docker](/readme_assets/two1.png)

2. Copy the contents of the image to the desired location using `docker cp saved_id:your_folder_name .` **DO NOT FORGET THE TRAILING PERIOD AT THE END**
   ![docker](/readme_assets/two2.png)

3. Check that it has been created using `ls` and navigate to the folder using `cd your_folder_name` and open your IDE, I use vsc for this, so I use `. code`
   ![docker](/readme_assets/two3.png)

Step 3

1. In the IDE (I use vsc), create .dockerignore and Dockerfile.

`.dockerignore`

```
# Node dependencies
node_modules

# Local env files
.env
.env.*
!.env.example

```

`Dockerfile`

```
FROM node:18-alpine
WORKDIR /docker-nuxt
COPY . .
EXPOSE 3000
CMD ["npm","run", "dev", "--", "--host"]

```

2. Create the Nuxt_DEV image using `docker build -t name_of_the_image_you_want .`
   This will read the Dockerfile and create an image based on it. If you are using Docker Desktop, you will see the image and its ID (the number below). You can also use docker ps and see it in the terminal. Copy and save the ID.
   DockerNuxt
   ![docker](/readme_assets/three1.png)
   ![docker](/readme_assets/three2.png)

3. Now you can create a container from this image with the volume direction in your project with:
   `docker run -d -p new_port_you_want:port_in_dockerfile -v ABSOLUTE_PATH_YOUR_WORK_APP:PATH_OF_YOUR_IMAGE --name NAME_TO_YOUR_CONTAINER_you_WANT name_or_ID_of_the_image`
   **EXAMPLE**:
   ![docker](/readme_assets/three3.png)

NOW you can open your port and see this (mine was 3001)

![docker](/readme_assets/three4.png)

Change something in the app.vue to test, and you should see the changes immediately.

NOTE: You can start (or stop) your container quickly in your docker desktop (actions):

![docker](/readme_assets/three5.png)

After that you can start your app folder as a repo if you need it.
