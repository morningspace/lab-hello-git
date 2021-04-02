## MorningSpace Lab 

晴耕实验室

[![](https://morningspace.github.io/assets/images/banner.jpg)](https://morningspace.github.io)

# Hello Git

Keywords: Git, GitWeb, Docker, SSH

## Overview

This is the lab project to demonstrate how to play with git.

This lab project is entirely based on Docker technology. You can play it in a sandbox at your local, which is composed by a couple of Docker containers.

There is one container working as local git, `my-git-local`, which is the container built from the image `morningspace/lab-git-local`. You can run git commands from command line in this container.

The other container working as remote git, `my-git-remote`, which is the container built from the image `morningspace/lab-git-remote`. Both openssh-server and gitweb are installed. So, you can either talk to `my-git-remote` via SSH from the command line within `my-git-local`, or HTTP from browser in your host machine.

Please check the **Instructions** section to learn how to play with it. There's also a video tutorial called **"Hello Git"** series both on YouTube and YouKu which is based on this lab project. You can find all video links below:

| Title	| Links
| ---- 	|:----
| 《Hello Git 0: How to Use Hello Git Project》		| [YouTube](https://youtu.be/14pBZSXHz-Y) [YouKu](http://v.youku.com/v_show/id_XMzk2NjQ5NzcyNA==.html)
| 《Hello Git 1: Initialize Repository》						| [YouTube](https://youtu.be/q2De0LrOZFk) [YouKu](http://v.youku.com/v_show/id_XMzk3NzM3OTIxMg==.html)
| 《Hello Git 2: Add Files》 											| [YouTube](https://youtu.be/yP9v4egMQwA) [YouKu](http://v.youku.com/v_show/id_XMzk3ODM0NjU4MA==.html)
| 《Hello Git 3: Add Remote Repository》 					| [YouTube](https://youtu.be/KjsexSUOdNA) [YouKu](http://v.youku.com/v_show/id_XMzk3ODQzMTU5Ng==.html)
| 《Hello Git 4: Understand Index》 								| [YouTube](https://youtu.be/dJSmmtiOoTM) [YouKu](http://v.youku.com/v_show/id_XMzk5MTU2NDk3Mg==.html)
| 《Hello Git 5: Reset to Specified Commit》 			| [YouTube](https://youtu.be/4361HjW1ldA) [YouKu](http://v.youku.com/v_show/id_XMzk5OTA3MzE2NA==.html)
| 《Hello Git 6: Revert Local Change》 						| [YouTube](https://youtu.be/7SpAQgzp0h8) [YouKu](http://v.youku.com/v_show/id_XMzk5OTA4NzY5Mg==.html)
| 《Hello Git 7: Delete File》 										| [YouTube](https://youtu.be/MN0FMGIPMVM) [YouKu](http://v.youku.com/v_show/id_XMzk5OTA4ODI1Mg==.html)
| 《Hello Git 8: Understand Branch》 							| [YouTube](https://youtu.be/1xx7-QDcQsY) [YouKu](http://v.youku.com/v_show/id_XNDAxMTgxMjg4NA==.html)
| 《Hello Git 9: Resolve Conflict》 								| [YouTube](https://youtu.be/wjz9tbGEvRg) [YouKu](http://v.youku.com/v_show/id_XNDAyMzk0MTY1Ng==.html)
| 《Hello Git 10: Branch for Bug Fix》							| [YouTube](https://youtu.be/G4M-ofXOqHg) [YouKu](http://v.youku.com/v_show/id_XNDA1NTQ0Mzc2OA==.html)
| 《Hello Git 11: Branch for Feature Development》	| [YouTube](https://youtu.be/0W1ylLgdwG4) [YouKu](http://v.youku.com/v_show/id_XNDA2NzQwMzU0MA==.html)
| 《Hello Git 12: Work with Your Mate》 						| [YouTube](https://youtu.be/mMSTEy5wbK0) [YouKu](http://v.youku.com/v_show/id_XNDA2NzQyNzMyNA==.html)
| 《Hello Git 13: Understand Rebase》 							| [YouTube](https://youtu.be/XraY8PGivxg) [YouKu](http://v.youku.com/v_show/id_XNDA3NTQ0OTk3Mg==.html)
| 《Hello Git 14: Manage Tags》 										| [YouTube](https://youtu.be/DI1_FastrNY) [YouKu](http://v.youku.com/v_show/id_XNDA3NTQ1MzYzNg==.html)

For more lab projects from MorningSpace Lab, please check [morningspace.github.io](https://morningspace.github.io).

## Instructions

### Build or Pull Docker Images

Go to the project root directory, and build docker images for both remote git and local git:
```shell
docker build -f docker/git-remote/Dockerfile -t morningspace/lab-git-remote .
docker build -f docker/git-local/Dockerfile -t morningspace/lab-git-local .
```

The docker images have also been pushed to Docker Hub. So, you can pull them from there too.
```
docker pull morningspace/lab-git-remote
docker pull morningspace/lab-git-local
```

### Launch Remote and Local Git

Launch one docker container for the image `morningspace/lab-git-remote` as remote git, and one for the image `morningspace/lab-git-local` as local git:
```
docker run -it --name my-git-remote --hostname my-git-remote --net=lab -p 8080:80 morningspace/lab-git-remote
docker run -it --name my-git-local --hostname my-git-local --net=lab morningspace/lab-git-local
```

Note:
* Make sure the network `lab` has been created beforehand by running below command:
```
docker network create lab
```

### Add Pubic Key

To connect to the remote git from your local git, you need to generate SSH key and add the public key to the remote git.

The image `morningspace/lab-git-local` has already created a default one for you. After launch the local git, you will see the welcome message with the public key output to the terminal. Copy the key and login to the remote git using `root:passw0rd`:
```
ssh root@my-git-remote
```

Add the key to `/home/git/.ssh/authorized_keys`:
```
echo <your_public_key> >> /home/git/.ssh/authorized_keys
```

### Clone Your First Git Repository

After the public key is added, you should be able to connect to the remote git using git commands from command line in your local git.

The image `morningspace/lab-git-remote` has already created a sample git repository called `hello-git.git` for you. Now, you can clone your first git repository in your local git container, say in your home directory:
```
cd
git clone git@my-git-remote:~/hello-git.git
```

### Play with Your Git Repository

Let's play a bit more with your `hello-git` repository.

Create `README` as below:
```
echo hello git! > README
```

Then push the change to remote git:
```
git add .
git commit -m 'Init commit'
git push origin master
```

You can do more as you wish. e.g. try branch, tag, etc.

### View Using GitWeb

To open GitWeb from your host machine, input the below URL in browser: http://localhost:8080/gitweb

![](docs/images/gitweb.png)

### Run Git Shell Commands

The image `morningspace/lab-git-remote` has pre-installed a couple of git shell commands that you can try.

Login to the remote git via SSH using `git` user.
```
ssh git@my-git-remote
```

It then lists all the commands available to you:

* create: Create an empty git repository in the remote git.
* list: List all existing git repositories in the remote git.
