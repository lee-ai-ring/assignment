# Run Automation Script Written in Robot Framework


## Getting Started

These instructions will provide step-by-step guideline on how to setup Robot Framework on your machine and ultimately run the automation scripts in "oppenheimer_project" folder.

## Prerequisites

```
•	Python v2.7 (May get the latest version)
•	Virtualenv v16.5.0 (May get the latest version)
•	pip v18.1 (May get the latest version)
•	ChromeDriver (May get the latest version)
```

## Steps

### Install Python 

1.	Open Terminal

2.	Install Python:

```
$ brew install python
```

### Install pip

1.	Install pip:

```
$ easy_install pip
```

### Install virtualenv

1.	Install virtualenv by running this command on terminal:

```
$ sudo -H pip install virtualenv
```

2.	Navigate to where you want to store your code.

```
$ cd Documents
```

3.	Create a new directory (eg. New folder named “my_project” in /Documents).

```
$ sudo mkdir my_project && cd my_project
```

4.	Create a new virtualenv in “my_project” folder

```
$ virtualenv env
```

5.	Activate virtualenv environment

```
$ source env/bin/activate
```

6.	Import Python path

```
$ export PYTHONPATH=library/.
```

### Create Requirements

1.	Create requirements.txt file in “my_project” folder

2.	Copy and paste the below into the requirements.txt file. Save the file.

```
robotframework 
robotframework-seleniumlibrary
RESTinstance
```

### Install Package

1.	Install necessary packages

```
$ pip install -r requirements.txt
```

### Install ChromeDriver
***ChromeDriver version has to be compatible with the Chrome version. 

1.	Install ChromeDriver

```
$ brew cask install chromedriver
```

### Run automation script

1. Download "oppenheimer_project" folder

2. Move it into to “my_project” folder

3. Open terminal

4. Navigate to “my_project” folder

```
$ cd Documents/my_project
```

5. Execute .robot files

```
$ robot oppenheimer_project
```
