package web.jdbc;

public class Student {
	private int id;
	private String firstName;
	private String lastName;
	private String studyPeriod;
	private int studyYear;
	private String email;
	private boolean scholarShip;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getStudyPeriod() {
		return studyPeriod;
	}
	public void setStudyPeriod(String studyPeriod) {
		this.studyPeriod = studyPeriod;
	}
	public int getStudyYear() {
		return studyYear;
	}
	public void setStudyYear(int studyYear) {
		this.studyYear = studyYear;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public boolean getScholarShip() {
		return scholarShip;
	}
	public void setScholarShip(boolean scholarShip) {
		this.scholarShip = scholarShip;
	}
	
	public Student(String firstName, String lastName, String studyPeriod, int studyYear, String email,
			String scholarShip, String scholarShipType) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.studyPeriod = studyPeriod;
		this.studyYear = studyYear;
		this.email = email;
	}
	public Student(int id, String firstName, String lastName, String studyPeriod, int studyYear, String email,
			boolean scholarShip) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.studyPeriod = studyPeriod;
		this.studyYear = studyYear;
		this.email = email;
		this.scholarShip = scholarShip;
	}
	@Override
	public String toString() {
		return "Student [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", studyPeriod="
				+ studyPeriod + ", studyYear=" + studyYear + ", email=" + email + ", scholarShip=" + scholarShip + "]";
	}
	
	
	
	
	
}
