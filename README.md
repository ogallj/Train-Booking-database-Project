# Train Booking Database Project

## **Objective**
This project involves designing and implementing a database for a train booking system. The system manages train journeys, stations, schedules, carriages, bookings, and passengers. The goal is to apply database design principles, create an Entity-Relationship Diagram (ERD), and implement the schema using SQL.

---

## **Project Structure**

### **Deliverables**
1. **Entity-Relationship Diagram (ERD)**
   - A diagram that visualizes the entities, attributes, relationships, and constraints in the database.
   - Created using tools such as Lucidchart, MySQL Workbench, draw.io, or dbdiagram.io.

2. **Database SQL File (booking.sql)**
   - Contains scripts to:
     - Create tables with constraints (primary keys, foreign keys, unique constraints).
     - Insert sample data into tables.

3. **GitHub Repository**
   - Public repository hosting the ERD (image or PDF) and `booking.sql` file.

### **Entities and Attributes**

1. **train_station**
   - `id` (Primary Key)
   - `station_name`

2. **train_journey**
   - `id` (Primary Key)
   - `schedule_id` (Foreign Key to `schedule.id`)
   - `name`

3. **journey_station**
   - `journey_id` (Foreign Key to `train_journey.id`)
   - `station_id` (Foreign Key to `train_station.id`)
   - `stop_order`
   - `departure_time`

4. **schedule**
   - `id` (Primary Key)
   - `name`

5. **carriage_class**
   - `id` (Primary Key)
   - `class_name`
   - `seating_capacity`

6. **journey_carriage**
   - `journey_id` (Foreign Key to `train_journey.id`)
   - `carriage_class_id` (Foreign Key to `carriage_class.id`)
   - `position`

7. **carriage_price**
   - `schedule_id` (Foreign Key to `schedule.id`)
   - `carriage_class_id` (Foreign Key to `carriage_class.id`)
   - `price`

8. **booking**
   - `id` (Primary Key)
   - `passenger_id` (Foreign Key to `passenger.id`)
   - `status_id` (Foreign Key to `booking_status.id`)
   - `booking_date`
   - `starting_station_id` (Foreign Key to `train_station.id`)
   - `ending_station_id` (Foreign Key to `train_station.id`)
   - `train_journey_id` (Foreign Key to `train_journey.id`)
   - `ticket_class_id` (Foreign Key to `carriage_class.id`)
   - `amount_paid`
   - `ticket_no`
   - `seat_no`

9. **passenger**
   - `id` (Primary Key)
   - `first_name`
   - `last_name`
   - `email_address`
   - `password`

10. **booking_status**
    - `id` (Primary Key)
    - `name`

---

## **Project Timeline**

### **Day 1:**
- Create the ERD.
- Define entities, attributes, and relationships.
- Plan the database structure.

### **Day 2:**
- Design the database schema.
- Write SQL scripts to create tables with constraints.

### **Day 3:**
- Populate the database with sample data.
- Test and ensure relational integrity.

### **Day 4:**
- Finalize the database schema.
- Update the ERD based on implementation.
- Prepare for the presentation.

---



## **Tools Used**
- **Database Management System:** MySQL
- **ERD Tools:** Lucidchart
- **Version Control:** GitHub

---

## **Contributors**
List the group members and their contributions:
- **Group Leader:** Responsible for repository management and submission.
- **Member 1 2:** ERD design and schema planning.
- **Member 3 4:** SQL scripts for table creation.
- **Member 5 6:** Sample data insertion and integrity testing.
- **Member 7 8 9 :** Final review and presentation preparation.
- **hillary kiprotich**
-rose samba
-ray basweti
-hassan khalifa	
-nasteha abdikadir
-saddam saku
-ezekiel juma
-solomon lemein
-dick omondi
-tom onyango
-Ogallo Joshua
---

## **Contact**
For any queries or issues, contact us via the repository or email.
