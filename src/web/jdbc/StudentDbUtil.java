package web.jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

public class StudentDbUtil {
	private static DataSource dataSource;
	
	public StudentDbUtil(DataSource theDataSource) {
		dataSource = theDataSource;
	}
	
	public List<Student> getStudents() throws Exception {
		
		List<Student> students = new ArrayList<>();
		
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
		try {
			//get connection
			myConn = dataSource.getConnection();
			
			//create sql statement
			String sql = "SELECT * FROM STUDENT ORDER BY last_name";
			myStmt = myConn.createStatement();
			
			//execute query
			myRs = myStmt.executeQuery(sql);
			
			//process result
			while(myRs.next()) {
				
				//retrieve data from result row 
				int id = myRs.getInt("id");
				String firstName = myRs.getString("first_name");
				String lastName = myRs.getString("last_name");
				String studyPeriod = myRs.getString("studyPeriod");
				String studyYear = myRs.getString("studyYear");
				String email = myRs.getString("email");
				Boolean scholarShip = myRs.getBoolean("scholarShip");
				
				//create new student object
				Student tempStudent = new Student(id, firstName, lastName, studyPeriod, studyYear, email, scholarShip);
				
				//add it to the list of students
				students.add(tempStudent);
			}
			//close JDBC Object
			
			return students;
		}
		finally{
			close(myConn, myStmt, myRs);
		}
		
		
	}

	private void close(Connection myConn, Statement myStmt, ResultSet myRs) {
		try {
			if(myConn != null) {
				myConn.close();
			}
			if(myStmt != null) {
				myStmt.close();
			}
			if(myRs != null) {
				myRs.close();
			}
					
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	public static void addStudent(Student theStudent) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		try {
		// get db connection
			myConn = dataSource.getConnection();
		// Create sql insert
			String sql = "insert into student"
					+ "(first_name, last_name, studyPeriod, studyYear, email, scholarShip)"
					+ "values (?, ?, ?, ?, ?, ?)";
			myStmt = myConn.prepareStatement(sql);
		// set the param values for the student
			myStmt.setString(1, theStudent.getFirstName());
			myStmt.setString(2, theStudent.getLastName());
			myStmt.setString(3, theStudent.getStudyPeriod());
			myStmt.setString(4, theStudent.getStudyYear());
			myStmt.setString(5, theStudent.getEmail());
			myStmt.setBoolean(6, theStudent.getScholarShip());
			
		// execute sql insert
			myStmt.execute();
		}
		finally {
		// clean up JDBC object
		
		}
		
	}

	public Student getStudent(String theStudentId) throws Exception {
		Student theStudent = null;
		
		Connection myConn = null;
		PreparedStatement myStmt= null;
		ResultSet myRs = null;
		int studentId;
		
		try {
			// convert student id to int
			studentId = Integer.parseInt(theStudentId);
			// get connection to database
			myConn = dataSource.getConnection();
			// create sql to get selected student
			String sql = "select * from student where id=?";
			// create prepare statement
			myStmt = myConn.prepareStatement(sql);
			// set params
			myStmt.setInt(1, studentId);
			// execute statement
			myRs = myStmt.executeQuery();
			// retrieve data from result set row
			if(myRs.next()) {
				String firstName = myRs.getString("first_name");
				String lastName = myRs.getString("last_name");
				String studyPeriod = myRs.getString("studyPeriod");
				String studyYear = myRs.getString("studyYear");
				String email = myRs.getString("email");
				Boolean scholarShip = myRs.getBoolean("scholarShip");
				
				// use the studentId during construction
				theStudent = new Student(studentId, firstName, lastName, studyPeriod, studyYear, email, scholarShip);
			}else {
				throw new Exception("Could not find student id:" + studentId);
			}
			return theStudent;
		}finally{
			close(myConn, myStmt, myRs);
		}
		
	}

	public void updateStudent(Student theStudent) throws Exception{
		
		Connection myConn = null;
		PreparedStatement myStmt= null;
		ResultSet myRs = null;
		
		try {
			
			// get connection to database
			myConn = dataSource.getConnection();
			
			// create sql to get selected student
			String sql = "update student set first_name=?, last_name=?, studyPeriod=?, studyYear=?, email=?, scholarShip=? where id=? ";
			
			// create prepare statement
			myStmt = myConn.prepareStatement(sql);
			// set params
			myStmt.setString(1, theStudent.getFirstName());
			myStmt.setString(2, theStudent.getLastName());
			myStmt.setString(3, theStudent.getStudyPeriod());
			myStmt.setString(4, theStudent.getStudyYear());
			myStmt.setString(5, theStudent.getEmail());
			myStmt.setBoolean(6, theStudent.getScholarShip());
			myStmt.setInt(7, theStudent.getId());
			
			// execute statement
			myStmt.execute();
			
			}finally{
				// clean up JDBC object
				close(myConn, myStmt, myRs);
		}
	}

	public void deleteStudent(String theStudentId) throws Exception{
		Connection myConn = null;
		PreparedStatement myStmt= null;
		
		try {
			
			// get connection to database
			myConn = dataSource.getConnection();
			
			// parse int the id
			int StudentId = Integer.parseInt(theStudentId);
			// create sql to get selected student
			String sql = "delete from student where id=?";
			
			// create prepare statement
			myStmt = myConn.prepareStatement(sql);
			// set param
			myStmt.setInt(1, StudentId);
			
			// execute statement
			myStmt.execute();
			
			}finally{
				// clean up JDBC object
				close(myConn, myStmt, null);
		}
		
	}

	public List<Student> searchStudents(String theSearchName)  throws Exception {

		List<Student> students = new ArrayList<>();
		
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRs = null;
		
		
		try {
			
			// get connection to database
			myConn = dataSource.getConnection();
			
	        //
	        // only search by name if theSearchName is not empty
	        //
			if (theSearchName != null && theSearchName.trim().length() > 0) {

				// create sql to search for students by name
				String sql = "select * from student where lower(first_name) like ? or lower(last_name) like ?";

				// create prepared statement
				myStmt = myConn.prepareStatement(sql);

				// set params
				String theSearchNameLike = "%" + theSearchName.toLowerCase() + "%";
				myStmt.setString(1, theSearchNameLike);
				myStmt.setString(2, theSearchNameLike);
				
			} else {
				// create sql to get all students
				String sql = "select * from student order by last_name";

				// create prepared statement
				myStmt = myConn.prepareStatement(sql);
			}
	        
			// execute statement
			myRs = myStmt.executeQuery();
			
			// retrieve data from result set row
			while (myRs.next()) {
					int id = myRs.getInt("id");
					String firstName = myRs.getString("first_name");
					String lastName = myRs.getString("last_name");
					String studyPeriod = myRs.getString("studyPeriod");
					String studyYear = myRs.getString("studyYear");
					String email = myRs.getString("email");
					Boolean scholarShip = myRs.getBoolean("scholarShip");
					
					// create new student obj
					Student tempStudent = new Student(id, firstName, lastName, studyPeriod, studyYear, email, scholarShip);
					
					//add it to the list of students
					students.add(tempStudent);
				}
				return students;
				
		}finally{ close(myConn, myStmt, myRs);}
		
		
		
	}
}
