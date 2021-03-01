# Oppgave 2

### 1. Setting up a Google cloud project:
In order for this to work you will need to have a Google cloud project with Cloud Storage Enabled.(Which it often is by default)


### 2. Getting Service account key:
When you have your project,  you need to create a Service account that have Storage admin rights.
- Go to IAM & Admin -> Service Accounts and click *+ CREATE SERVICE ACCOUNT*
- Give it a name and click *CREATE*
- When asked for a role, select Storage Admin.
- Click done, and it will redirect you to the list of your Service accounts.

**Creating the Key**

- click on your service account you just created.
- click the *key* tab
- click *ADD KEY*->*Create new key*
- Make sure the key type is JSON
- click *CREATE*

this will download a json file. 

- Copy this file to the root folder of this project
- Rename the file to "google_service_key.json"



### 3. Setting up required variables:

First you will need to set some env variables.

This will differ depending on which os you are using.

**PC:**

Set your Bucket name:

```set bucket-name=YOUR_BUCKET_NAME```

Set your Project ID:

```set project-id=YOUR_PROJECT_ID```

Apply your env variables to the TF variables 

```set TF_VAR_project_id=%project-id%```

```set TF_VAR_bucket=%bucket-name%```

**Mac:**

Set your Bucket name:

```export bucket-name=YOUR_BUCKET_NAME```

Set your Project ID:

```export project-id=YOUR_PROJECT_ID```

apply your env variables to the TF variables 

```export TF_VAR_project_id=$project-id```

```export TF_VAR_bucket=$bucket-name```

### 4 Run Terraform commands

Now you should be able to run these commands in the init folder:

```terraform init```

```terraform apply```

This will create a bucket in your cloud

# Oppgave 3

Make sure you have these apis enabled in your Project:

Cloud Storage, Compute engine api, Identity and Access Management (IAM) API

*Go to APIs & services->Dashboard and add them one by one by clicking **+ ENABLE APIS AND SERVICES***

### Adding new roles to your service account

Add these roles to your Service account:

Service Account User

Service Account Admin

Compute Admin

This also implies that you still have storage admin from the previous task.

### Make small changes to travis.yml

on line 3 in travis.yml you will need to update ```- GCP_PROJECT_ID=kontreview``` to your project Id:

```- GCP_PROJECT_ID=YOUR-PROJECT-ID-HERE ```

### Set your bucket name

in backend.tf change the bucket to the one you created in task 2.

```bucket  = "bucktesteyo"```  to ``` bucket  = "YOUR_BUCKET_NAME"``` 


### Encrypt google service key

This will assume that you have travis installed and that you are logged in correctly

run this in your terminal at the root of this project.

 ```travis encrypt-file google_service_key.json --pro```
 When you run this it is important to copy the openssl command and replace it with the one
 at line 10 in .travis.yml.
 
 or
 
 You can remove the remove the existing openssl command in .travis.yml file and run:
 
  ```travis encrypt-file google_service_key.json --pro --add```
 
A .enc file of your google_service_key.json file should now have been created.

### Set machine type

execute this command in your terminal:

 ```travis env set TF_ENV_machine_type f1-micro --public  ```
 
 ### Publish
 now add, commit, and push the changes to master.
 
 After travis is done, a new VM instances with the name "test-account" and the Machine type you set should now have been created.
 
 (name dosen't make sense i know)
 
 


