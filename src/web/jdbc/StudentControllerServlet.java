package web.jdbc;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class StudentControllerServlet
 */
@WebServlet("/StudentControllerServlet")
public class StudentControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private StudentDbUtil studentDbUtil;

	@Resource(name = "jdbc/web_student_tracker")
	private DataSource dataSource;

	@Override
	public void init() throws ServletException {
		super.init();

		// Create our student db util, pass in the conn pool / datasource
		try {
			studentDbUtil = new StudentDbUtil(dataSource);
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// read the command
		String theCommand = request.getParameter("command");

		if (theCommand == null) {
			theCommand = "LIST";
		}
		// route to the appropriate method
		switch (theCommand) {
		case "LIST":
			try {
				listStudents(request, response);
				break;
			} catch (Exception e) {
				e.printStackTrace();
			}

		case "ADD":
			addStudent(request, response);
			break;

		case "LOAD":
			try {
				loadStudent(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;

		case "UPDATE":
			try {
				updateStudent(request, response);
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			break;
			
		case "DELETE":
			try {
				deleteStudent(request, response);
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			break;
			
		case "SEARCH":
			try {
				searchStudents(request, response);
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			break;
			
		default:
			try {
				listStudents(request, response);
				break;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// list the students .. in MVC

	}

	private void searchStudents(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// read search name from form data
		String theSearchName = request.getParameter("theSearchName");
		
		// search students from db util
		List<Student> students = studentDbUtil.searchStudents(theSearchName);
		
		// add students to the request
		request.setAttribute("STUDENTS_LIST", students);
				
		// send to JSP page (view)
		RequestDispatcher dispatcher = request.getRequestDispatcher("/list-students.jsp");
		dispatcher.forward(request, response);
	}
	

	private void deleteStudent(HttpServletRequest request, HttpServletResponse response) throws Exception{
		 // read student id from form data
		String theStudentId = request.getParameter("studentId");
		// delete student from database
		try {
			studentDbUtil.deleteStudent(theStudentId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// send them back to list student page
		listStudents(request, response);
	}

	private void updateStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// read student info form data 
		int theStudentId = Integer.parseInt(request.getParameter("studentId"));
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String studyPeriod = request.getParameter("studyPeriod");
		String studyYear = request.getParameter("studyYear");
		String email = request.getParameter("email");
		boolean scholarShip = Boolean.parseBoolean(request.getParameter("scholarShip"));
		// create a new student object
		Student theStudent = new Student(theStudentId, firstName, lastName, studyPeriod, studyYear, email, scholarShip);
		// perform update to database
		studentDbUtil.updateStudent(theStudent);
		// send them back to the list students page
		listStudents(request, response);
	}

	private void loadStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// read student id from form data
		String theStudentId = request.getParameter("studentId");
		// get student from database (db util)
		Student theStudent = studentDbUtil.getStudent(theStudentId);
		// place student in the request attribute
		request.setAttribute("THE_STUDENT", theStudent);
		// send to jsp page: update-student-form.jsp
		RequestDispatcher dispatcher = request.getRequestDispatcher("/update-student-form.jsp");
		dispatcher.forward(request, response);

	}

	private void addStudent(HttpServletRequest request, HttpServletResponse response) {

		// read student info from form data
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String studyPeriod = request.getParameter("studyPeriod");
		String studyYear = request.getParameter("studyYear");
		String email = request.getParameter("email");
		boolean scholarShip = Boolean.parseBoolean(request.getParameter("scholarShip"));

		// create a new student object
		Student theStudent = new Student(firstName, lastName, studyPeriod, studyYear, email, scholarShip);

		// add the student to the data base
		try {
			StudentDbUtil.addStudent(theStudent);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		// send back to main page
		try {
			listStudents(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void listStudents(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// get students from db util
		List<Student> students = studentDbUtil.getStudents();

		// add student to the request
		request.setAttribute("STUDENTS_LIST", students);

		// send to JSP page (view)
		RequestDispatcher dispatcher = request.getRequestDispatcher("/list-students.jsp");
		dispatcher.forward(request, response);
	}

}
