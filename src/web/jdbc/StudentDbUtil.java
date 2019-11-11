package web.jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

public class StudentDbUtil {
	private DataSource dataSource;
	
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
				int studyYear = myRs.getInt("studyYear");
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
}
