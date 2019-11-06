package mvctwo;

import java.util.ArrayList;
import java.util.List;

public class StudentDataUtil {
	
	public static List<Student> getStudents(){
		// create an empty list
		List<Student> students = new ArrayList<>();
		//add sample data
		students.add(new Student("Mary", "Public", "maryp@gmail.com"));
		students.add(new Student("John", "Doe", "johnd@gmail.com"));
		students.add(new Student("Howard", "Stark", "howards@gmail.com"));
		//return the list
		return students;
	}
}
