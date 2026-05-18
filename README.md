# BarnDataBase

## Equestrian Boarding and Training Facility Database Project

I created a database for an equestrian boarding and training facility as I have rode horses 12 out of 20 years of my life as well as train horses and riders as one of my jobs. The database will store information regarding owners, boarders, trainers, students, horses and lessons. The Boarding barns should be able to track the owners of the horses, location of horses, who trains who, and lesson schedule. It can get quite difficult to manage all this data without the use of a database software. Using a relational database will enable efficient storing of information related to the care of horses, schedule of lessons, trainer assignments and information about customers. 

Table 1: BarnOwners
Attribute	Data Type	Description
OwnerID (PK)	Integer	Unique identifier for each barn owner
FirstName	Varchar	Barn owner’s first name
LastName	Varchar	Barn owner’s last name
PhoneNumber	Varchar	Contact phone number
Email	Varchar	Email address
BarnName	Varchar	Name of the boarding facility

Table 2: Boarders
Attribute	Data Type	Description
BoarderID (PK)	Integer	Unique identifier for each boarder
FirstName	Varchar	Boarder’s first name
LastName	Varchar	Boarder’s last name
PhoneNumber	Varchar	Contact phone number
Email	Varchar	Boarder email address
HorseID (FK)	Integer	References the boarded horse
OwnerID (FK)	Integer	References the barn owner

Table 3: Trainers
Attribute	Data Type	Description
TrainerID (PK)	Integer	Unique identifier for each trainer
FirstName	Varchar	Trainer’s first name
LastName	Varchar	Trainer’s last name
Specialty	Varchar	Training specialty such as Jumping or Dressage
PhoneNumber	Varchar	Contact number
YearsExperience	Integer	Number of years of experience
OwnerID (FK)	Integer	References the barn owner who employs the trainer

Table 4: Students
Attribute	Data Type	Description
StudentID (PK)	Integer	Unique identifier for each student
FirstName	Varchar	Student’s first name
LastName	Varchar	Student’s last name
RidingLevel	Varchar	Skill level such as Beginner or Advanced
PhoneNumber	Varchar	Contact number
Email	Varchar	Student email address
TrainerID (FK)	Integer	References the student’s trainer

Table 5: Horses
Attribute	Data Type	Description
HorseID (PK)	Integer	Unique identifier for each horse
HorseName	Varchar	Name of the horse
Breed	Varchar	Horse breed
Age	Integer	Horse age
Discipline	Varchar	Riding discipline
BoarderID (FK)	Integer	References the boarder who owns the horse

Table 6: Lessons
Attribute	Data Type	Description
LessonID (PK)	Integer	Unique identifier for each lesson
LessonDate	Date	Date of the lesson
LessonTime	Time	Scheduled lesson time
StudentID (FK)	Integer	References the student taking the lesson
TrainerID (FK)	Integer	References the trainer teaching the lesson
HorseID (FK)	Integer	References the horse used in the lesson
DurationMinutes	Integer	Length of lesson in minutes

