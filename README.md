The Prime Minister Challenge/Quest
# Instructions


This folder contains a complete version of the Prime Minister Challenge.

## Using this repo
- Run `git clone <repo-link>`
- Run `cd PM-Challenge`		
- Run `git init`
- Run `cd api`	
- Run `npm install’


### Setup the env
- Create a `.env` file with two keys:

- A `PORT` key assigned to the port 3000 
- A `DB_URL` key assigned to the database URL using Supabase
-`BCRYPT_SALT_ROUNDS=10` configures the bcrypt hashing function
-`SECRET_TOKEN=mysecret` setup user secret key 


### Setup the database
- Run `cd api`
- Run `npm run setup-db` to setup the database


### To run the server
- Run `cd api`
- `npm install`
- `npm run dev`


### Features
-Feature 1: will show all feedback from the submitted from feedback-form.html            -GET
http://localhost:3000/feedback


-Feature 2: will show all feedback from the submitted from feedback-form.html            -POST
http://localhost:3000/feedback


-Feature 3: Show quiz questions for a nation: 1=USA, 2=UK, 3=India, 4=Egypt, 5=Germany   -GET
http://localhost:3000/quiz-questions/1


-Feature 4: will get results                                                             -GET
http://localhost:3000/quiz-results/


-Feature 5: Create a new quiz result on the database.                                    -POST
http://localhost:3000/quiz-results/




### Known Issues
-Using back arrow on quiz will still mark country as clicked, even though quiz isnt finished.


### Future Features
-Make Teacher table: highlights score by question category- this will allow teacher to see if students are struggling in a subject.
-Integrate Music round.
-Integrate snap functions.
-Add more games for country.