CREATE TABLE guestLists (
	guestListID SERIAL PRIMARY KEY,
	guestMemberID int array
);

CREATE TABLE rooms (
	roomID SERIAL PRIMARY KEY,
	guestListID int,
	keyReceived time,
	keyReturned time,
	CONSTRAINT fk_guestListID FOREIGN KEY (guestListID) REFERENCES guestLists(guestListID)
);

CREATE TABLE churches (
	churchID SERIAL PRIMARY KEY,
	churchName text
);

CREATE TABLE activities(
	activityID SERIAL PRIMARY KEY,
	activityName text,
	startTime time,
	endTime time
);

CREATE TABLE members (
	memberID SERIAL PRIMARY KEY,
	firstName text,
	lastName text,
	churchID int,
	checkInTime time,
	checkOutTime time,
	nationality text,
	roomID int,
	CONSTRAINT fk_churchID FOREIGN KEY (churchID) REFERENCES churches(churchID),
	CONSTRAINT fk_roomID FOREIGN KEY (roomID) REFERENCES rooms(roomID)
);


CREATE TABLE attendanceRecords(
	attendanceRecordID SERIAL PRIMARY KEY,
	activityID int,
	memberID int,
	CONSTRAINT fk_activityID FOREIGN KEY (activityID) REFERENCES activities(activityID),
	CONSTRAINT fk_memberID FOREIGN KEY (memberID) REFERENCES members(memberID)
);