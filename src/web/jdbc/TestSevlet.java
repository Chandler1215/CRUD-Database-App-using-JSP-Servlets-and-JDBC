package web.jdbc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class TestSevlet
 */
@WebServlet("/TestSevlet")
public class TestSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// Define datasource/connection pool for Resource Injection
	@Resource(name="jdbc/web_student_tracker")
	private DataSource dataSource;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// Set up the printwriter
		PrintWriter out = response.getWriter();
		response.setContentType("text/plain");
		// Get a connection to the database
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
		try {
		myConn = dataSource.getConnection();
				
		// Create a SQL statements
		String sql = "select * from student";
		myStmt = myConn.createStatement();
		// Execute SQL Query
		myRs = myStmt.executeQuery(sql);
		// Procces the result set
		while(myRs.next()) {
			String email = myRs.getString("email");
			out.println(email);
		}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
