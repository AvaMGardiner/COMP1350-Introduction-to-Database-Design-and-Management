create schema HotelReservation;
use HotelReservation;
 
create table VillaType
(
VillaTypeID char(5) primary key,
VillaTypeName varchar(40)
);
 
create table Villa
(
VillaID char(5) primary key,
VillaName varchar(40),
VillaCostPerDay decimal, 
VillaTypeID char(10),
foreign key (VillaTypeID) references VillaType (VillaTypeID)
);
 
create table Customer 
(
CustomerID char(5) primary key,
CustomerName varchar(40),
CustomerPhNumber int (10)
);
 
create table Reservation
(
ReservationID char(5) primary key,
ReservationDate date,
CustomerID char(5),
foreign key (CustomerID) references Customer (CustomerID)
);
 
create table Villa_Reservation
(
Villa_ReservationID char(5),
VillaID char(5),
DateFrom date,
DateTo date,
primary key (VillaID, Villa_ReservationID),
foreign key (Villa_ReservationID) references Reservation (ReservationID),
foreign key (VillaID) references Villa (VillaID)
);
 
create table payment 
(
PaymentID char(5) primary key,
ReservationID char(5),
PaymentDate date,
PaymentAmount int(5),
foreign key (ReservationID) references Reservation (ReservationID)
);

CREATE TABLE Activity
(
ActivityID CHAR(5) PRIMARY KEY,
ActivityName VARCHAR(40),
ActivityCost DECIMAL,
ActivityType VARCHAR(5)
);

CREATE TABLE Staff
(
StaffID CHAR(5) PRIMARY KEY,
StaffName VARCHAR(40),
ManagerID CHAR(5),
FOREIGN KEY (ManagerID) REFERENCES Staff(StaffID)
);

CREATE TABLE ActivityBooking
(
ActivityID CHAR(5),
ReservationID CHAR(5),
ActivityTime TIMESTAMP,
NumPeople INT,
GuideID CHAR(5),
PRIMARY KEY (ActivityID, ReservationID, ActivityTime),
FOREIGN KEY (ActivityID) REFERENCES Activity (ActivityID),
FOREIGN KEY (ReservationID) REFERENCES Reservation (ReservationID),
FOREIGN KEY (GuideID) REFERENCES Staff (StaffID)
);

CREATE TABLE SupportStaff
(
RosterID CHAR(5) PRIMARY KEY,
ActivityID CHAR(5),
ReservationID CHAR(5),
ActivityTime TIMESTAMP,
StaffID CHAR(5),
HoursNeeded INT,
FOREIGN KEY (ActivityID) REFERENCES ActivityBooking (ActivityID),
FOREIGN KEY (ReservationID) REFERENCES Reservation (ReservationID),
FOREIGN KEY (StaffID) REFERENCES Staff (StaffID)
);

CREATE TABLE Package
(
PackageActivityID CHAR(5),
ChildActivityID CHAR(5),
PRIMARY KEY (PackageActivityID, ChildActivityID),
FOREIGN KEY (PackageActivityID) REFERENCES Activity (ActivityID),
FOREIGN KEY (ChildActivityID) REFERENCES Activity (ActivityID)
);

INSERT INTO VillaType VALUES ('T1','One Bedroom Garden View with a Pool');
INSERT INTO VillaType VALUES ('T2','One Bedroom Ocean View with a Pool');
INSERT INTO VillaType VALUES ('T3','Two Bedroom River View with a Pool');
INSERT INTO VillaType VALUES ('T4','Two Bedroom Beachfront with a Pool');
INSERT INTO VillaType VALUES ('T5','Three Bedroom Mountaintop with a Pool');
INSERT INTO VillaType VALUES ('T6','Three Bedroom Jungle View with a Pool');

INSERT INTO Villa VALUES ('V14','Picadilly Green','650.00','T1');
INSERT INTO Villa VALUES ('V15','Silver Springs','750.00','T2');
INSERT INTO Villa VALUES ('V16','RiversideRidgeMount','850.00','T3');
INSERT INTO Villa VALUES ('V17','Beach Grove','950.00','T4');
INSERT INTO Villa VALUES ('V18','The Alps','1050.00','T5');
INSERT INTO Villa VALUES ('V19','Jungle Woods', '1150.00','T6');

INSERT INTO Customer VALUES ('C345','Dougie Jive','0491570156');
INSERT INTO Customer VALUES ('C346','Lennie Krueger','0491570157');
INSERT INTO Customer VALUES ('C347','Cindy Cline','0491570158');
INSERT INTO Customer VALUES ('C348','Honey Rossi','0491570159');
INSERT INTO Customer VALUES ('C349','Willa Sweeney','0491570110');
INSERT INTO Customer VALUES ('C350','Zaki Ibarra','0406659528');
INSERT INTO Customer VALUES ('C351','Odin Salas','0470103820');
INSERT INTO Customer VALUES ('C352','Klara Stevenson','0478010005');
INSERT INTO Customer VALUES ('C353','Lochlan Jarrow','0470108612');
INSERT INTO Customer VALUES ('C354','Lola-Mae Timms','0490110987');

INSERT INTO Reservation VALUES ('R321','2020-06-12','C345');
INSERT INTO Reservation VALUES ('R322','2020-06-14','C346');
INSERT INTO Reservation VALUES ('R323','2020-06-18','C347');
INSERT INTO Reservation VALUES ('R324','2020-06-21','C348');
INSERT INTO Reservation VALUES ('R325','2020-06-25','C349');
INSERT INTO Reservation VALUES ('R326','2020-06-29','C350');
INSERT INTO Reservation VALUES ('R327','2020-06-30','C351');
INSERT INTO Reservation VALUES ('R328','2020-07-01','C352');
INSERT INTO Reservation VALUES ('R329','2020-07-02','C353');
INSERT INTO Reservation VALUES ('R330','2020-07-05','C354');

INSERT INTO Villa_Reservation VALUES ('R321','V19','2020-12-01','2020-12-06');
INSERT INTO Villa_Reservation VALUES ('R322','V19','2020-12-01','2020-12-09');
INSERT INTO Villa_Reservation VALUES ('R323','V17','2020-12-08','2020-12-15');
INSERT INTO Villa_Reservation VALUES ('R324','V16','2020-12-10','2020-12-20');
INSERT INTO Villa_Reservation VALUES ('R325','V14','2020-12-14','2020-12-16');
INSERT INTO Villa_Reservation VALUES ('R326','V19','2020-12-14','2020-12-17');
INSERT INTO Villa_Reservation VALUES ('R327','V16','2020-12-15','2020-12-20');
INSERT INTO Villa_Reservation VALUES ('R328','V16','2020-12-15','2020-12-25');
INSERT INTO Villa_Reservation Values ('R329','V15','2020-12-13','2020-12-20');
INSERT INTO Villa_Reservation Values ('R330','V19','2020-12-18','2020-12-28');

INSERT INTO Payment VALUES ('P300','R321','2020-06-12','3250');
INSERT INTO Payment VALUES ('P301','R322','2020-06-14','2300');
INSERT INTO Payment VALUES ('P302','R323','2020-06-18','6650');
INSERT INTO Payment VALUES ('P303','R324','2020-06-21','8500');
INSERT INTO Payment VALUES ('P304','R325','2020-06-25','1300');
INSERT INTO Payment VALUES ('P305','R326','2020-06-29','3450');
INSERT INTO Payment VALUES ('P306','R327','2020-06-30','4250');
INSERT INTO Payment VALUES ('P307','R328','2020-07-01','8550');
INSERT INTO Payment VALUES ('P308','R329','2020-07-02','5250');
INSERT INTO Payment VALUES ('P309','R330','2020-07-05','11500');

INSERT INTO Activity VALUES ('A01','Kayaking','120.00','O');
INSERT INTO Activity VALUES ('A02','Horse Riding','500.00','O');
INSERT INTO Activity VALUES ('A03','Basket Ball','100.00','I');
INSERT INTO Activity VALUES ('A04','Tennis','100.00','O');
INSERT INTO Activity VALUES ('A05','Boxing','350.00','B');
INSERT INTO Activity VALUES ('A06','Indoor Hockey','130.00','I');
INSERT INTO Activity VALUES ('A07','Golf','300.50','O');
INSERT INTO Activity VALUES ('A08','Squash','100.00','I');
INSERT INTO Activity VALUES ('A09','Indoor Cycling','500.00','I');
INSERT INTO Activity VALUES ('A10','Scuba Diving','500.00','O');
 
INSERT INTO Staff VALUES ('S1','Dora Wagner',NULL);
INSERT INTO Staff VALUES ('S2','Md Townsend','S1');
INSERT INTO Staff VALUES ('S3','Hannah Stephenson','S1');
INSERT INTO Staff VALUES ('S4','Sioned Warner',NULL);
INSERT INTO Staff VALUES ('S5','Jolie Rayner',NULL);
INSERT INTO Staff VALUES ('S6','Emilis Whitley',NULL);
INSERT INTO Staff VALUES ('S7','Allen Henderson','S4');
INSERT INTO Staff VALUES ('S8','Justine Guthrie','S6');
INSERT INTO Staff VALUES ('S9','Ryder William','S4');
INSERT INTO Staff VALUES ('S10','Ross Ferrell',Null);
 
INSERT INTO ActivityBooking VALUES ('A01','R321','2020-12-05, 13:30','4','S2');
INSERT INTO ActivityBooking VALUES ('A02','R322','2020-12-08, 09:00','6','S4');
INSERT INTO ActivityBooking VALUES ('A03','R323','2020-12-10, 15:45','2','S3');
INSERT INTO ActivityBooking VALUES ('A04','R324','2020-12-13, 12:30','5','S1');
INSERT INTO ActivityBooking VALUES ('A05','R325','2020-12-15, 08:30','10','S5');
INSERT INTO ActivityBooking VALUES ('A06','R326','2020-12-16, 14:45','3','S6');
INSERT INTO ActivityBooking VALUES ('A07','R327','2020-12-17, 10:00','8','S10');
INSERT INTO ActivityBooking VALUES ('A08','R328','2020-12-17, 09:45','4','S8');
INSERT INTO ActivityBooking VALUES ('A09','R329','2020-12-18, 18:45','5','S10');
INSERT INTO ActivityBooking VALUES ('A10','R330','2020-12-19, 16:00','2','S9');
 
INSERT INTO SupportStaff VALUES ('R2351','A01','R321','2020-12-05, 13:30','S1','4');
INSERT INTO SupportStaff VALUES ('R2352','A02','R322','2020-12-08, 09:00','S3','5');
INSERT INTO SupportStaff VALUES ('R2353','A03','R323','2020-12-10, 15:45','S2','3');
INSERT INTO SupportStaff VALUES ('R2354','A04','R324','2020-12-13, 12:30','S4','5');
INSERT INTO SupportStaff VALUES ('R2355','A05','R325','2020-12-15, 08:30','S6','6');
INSERT INTO SupportStaff VALUES ('R2356','A06','R326','2020-12-16, 14:45','S5','4');
INSERT INTO SupportStaff VALUES ('R2357','A07','R327','2020-12-17, 10:00','S6','5');
INSERT INTO SupportStaff VALUES ('R2358','A08','R328','2020-12-17, 09:45','S7','6');
INSERT INTO SupportStaff VALUES ('R2359','A09','R329','2020-12-18, 18:45','S8','3');
INSERT INTO SupportStaff VALUES ('R2360','A10','R330','2020-12-19, 16:00','S9','5');
 
INSERT INTO Package VALUES ('A01','A02');
INSERT INTO Package VALUES ('A08','A04');
INSERT INTO Package VALUES ('A05','A06');
INSERT INTO Package VALUES ('A07','A03');
INSERT INTO Package VALUES ('A09','A10');

-- TASK TWO
Select VillaID, VillaName, CONCAT("$", VillaCostPerDay)
From Villa
Order By VillaCostPerDay DESC;
 
-- TASK THREE
Select VillaID, DateFrom 'Check In', DateTo 'Check Out', datediff(DateTo, DateFrom) 'Number of Days'
From Villa_Reservation;
 
-- TASK FOUR
SELECT vt.VillaTypeName, v.VillaName, v.VillaCostPerDay
FROM VillaType vt, Villa v
WHERE vt.VillaTypeID = v.VillaTypeID
AND vt.VillaTypeName LIKE '%Two Bedroom%';
 
-- TASK FIVE
SELECT DISTINCT r.ReservationID
FROM reservation r, payment p
WHERE r.ReservationID = p.ReservationID AND 
p.PaymentDate BETWEEN r.ReservationDate AND DATE_ADD(r.ReservationDate, INTERVAL 5 DAY);
 
-- TASK SIX
SELECT CustomerName, CustomerPhNumber
FROM customer
WHERE CustomerID IN (
SELECT r.CustomerID
FROM reservation r
WHERE r.ReservationDate BETWEEN DATE_SUB(CURDATE(), INTERVAL 6 MONTH) AND CURDATE()
);
 
-- TASK SEVEN
SELECT CustomerName, CustomerPhNumber
FROM customer c
JOIN reservation r USING (CustomerID)
WHERE r.ReservationDate BETWEEN DATE_SUB(CURDATE(), INTERVAL 6 MONTH) AND CURDATE();
 
-- TASK EIGHT
SELECT DISTINCT CustomerName
FROM customer c, reservation r, villa_reservation vr, villa v
WHERE c.CustomerID = r.CustomerID AND r.ReservationID = vr.Villa_ReservationID
AND vr.VillaID = v.VillaID
AND v.VillaCostPerDay < 1000;
 
-- TASK NINE
SELECT ReservationID, SUM(PaymentAmount)
FROM payment
GROUP BY ReservationID
ORDER BY SUM(PaymentAmount) DESC;
 
-- TASK TEN
SELECT r.ReservationID, r.ReservationDate, COUNT(vr.Villa_ReservationID) 'No. of Villas'
FROM reservation r, villa_reservation vr
WHERE r.ReservationID = vr.Villa_ReservationID
GROUP BY r.ReservationID
HAVING COUNT(vr.Villa_ReservationID) > 1;

-- TASK ELEVEN
SELECT *
FROM villa
WHERE VillaID NOT IN (
SELECT VillaID
FROM villa_reservation
);
 
-- TASK TWELVE
SELECT *
FROM payment
WHERE PaymentAmount > 1500
AND (MONTH(PaymentDate) = 1 OR YEAR(PaymentDate) IN (2018, 2020))
ORDER BY PaymentAmount DESC;
 
-- TASK THIRTEEN
SELECT p.*
FROM payment p, customer c, reservation r, villa_reservation vr, villa v, villatype vt
WHERE p.ReservationID = r.ReservationID
AND r.CustomerID = c.CustomerID
    AND r.ReservationID = vr.Villa_ReservationID
    AND vr.VillaID = v.VillaID
    AND v.VillaTypeID = vt.VillaTypeID
    AND vt.VillaTypeName LIKE '%one bedroom%'
    AND SUBSTRING_INDEX(c.CustomerName, ' ', -1) LIKE 'J%';

-- TASK FOURTEEN
SELECT vr.Villa_ReservationID, DATEDIFF(vr.DateTo, vr.DateFrom) * v.VillaCostPerDay 'Total Cost'
FROM villa_reservation vr, villa v
WHERE vr.VillaID = v.VillaID
AND DATEDIFF(vr.DateTo, vr.DateFrom) * v.VillaCostPerDay > 10000;
 
-- TASK FIFTEEN
    SELECT c.CustomerName, a.ActivityCost 
    FROM customer c, reservation r, activitybooking ab, activity a
    WHERE c.CustomerID = r.CustomerID
    AND r.ReservationID = ab.ReservationID
    AND ab.ActivityID = a.ActivityID
    AND a.ActivityType = 'O'
    AND a.ActivityCost < (
    SELECT AVG(a.ActivityCost)
    FROM Activity a
    WHERE a.ActivityType = 'O');
    
-- TASK SIXTEEN
SELECT c.CustomerName, a.ActivityID, ab.ReservationID, ab.ActivityTime 'Time of the Activity Reservation',
a.ActivityName 'Name of the Activity', s.StaffName
FROM Customer c, activitybooking ab, activity a, staff s, supportstaff ss, reservation r
WHERE ab.ActivityID = a.ActivityID
AND ab.GuideID = s.StaffID
AND s.StaffID = ss.StaffID
AND ab.ActivityID = ss.ActivityID
AND ab.ReservationID = ss.ReservationID
AND ab.ActivityTime = ss.ActivityTime
AND c.customerID = r.CustomerID
AND r.ReservationID = ab.ReservationID
AND ab.ActivityTime BETWEEN '12:00:00' and '16:00:00'
GROUP BY a.ActivityID, ab.ReservationID, ab.ActivityTime, a.ActivityName, s.StaffName;

-- TASK SEVENTEEN
SELECT s.StaffName , m.StaffName 'Manager'
FROM staff s, staff m
WHERE s.ManagerID = m.StaffID
GROUP BY m.StaffName
HAVING COUNT(s.StaffName) >= 2;

-- TASK EIGHTEEN
SELECT a.ActivityID, ab.ReservationID, ab.ActivityTime 'Time of the Activity Reservation', 
a.ActivityName 'Name of the Activity', s.StaffName
FROM activitybooking ab, activity a, staff s, supportstaff ss
WHERE ab.ActivityID = a.ActivityID
AND ab.GuideID = s.StaffID
    AND s.StaffID = ss.StaffID
    AND ab.ActivityID = ss.ActivityID
    AND ab.ReservationID = ss.ReservationID
    AND ab.ActivityTime = ss.ActivityTime
GROUP BY a.ActivityID, ab.ReservationID, ab.ActivityTime, a.ActivityName, s.StaffName;
 
-- TASK NINETEEN
SELECT p.PackageActivityID, a.ActivityName, a.ActivityCost, p.ChildActivityID 'Sub Activity ID',
(SELECT sub.ActivityName
FROM activity sub
WHERE sub.ActivityID = p.ChildActivityID) 'Sub Activity Name',
(SELECT MIN(sub.ActivityCost)
FROM activity sub
WHERE sub.ActivityID = p.ChildActivityID
GROUP BY p.PackageActivityID) 'Sub Activity Cost'
FROM activity a, package p
WHERE a.ActivityID = p.PackageActivityID;
 
-- TASK TWENTY
SELECT r.ReservationID,
CONCAT('$', FORMAT(IFNULL(
(SELECT ActivityCost*NumPeople
FROM activity a, activitybooking ab
WHERE ab.ReservationID = r.ReservationID
AND ab.ActivityID = a.ActivityID
), 0), 2)) 'Activity Cost',
    CONCAT('$', FORMAT(IFNULL(
(SELECT VillaCostPerDay*datediff(DateTo,DateFrom)
FROM villa_reservation vr, villa v
WHERE vr.Villa_ReservationID = r.ReservationID
AND vr.VillaID = v.VillaID
), 0), 2)) 'Villa Cost'
FROM reservation r
GROUP BY r.ReservationID;