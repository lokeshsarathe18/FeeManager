package techsolutions.student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import techsolutions.db.FeeDB;
import techsolutions.util.Password;

public class StudentDAO {
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	public boolean addStudent(StudentDTO dto) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = FeeDB.getConnection();
			}
			String query = "insert into student_master(name, eno, gender, course, address, mno, pwd, sem) values(?,?,?,?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(query);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getEno());
			ps.setString(3, dto.getGender());
			ps.setString(4, dto.getCourse());
			ps.setString(5, dto.getAddress());
			ps.setString(6, dto.getMno());
			ps.setString(7, Password.encrypt(dto.getPwd()));
			ps.setInt(8, dto.getSem());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("+++Exception in addStudent: " + e);
		} finally {
			ps = null;
			rs = null;
			conn = null;
			return flag;
		}
	}

	public boolean updateStudent(StudentDTO dto) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = FeeDB.getConnection();
			}
			String query = "update student_master set name=?, eno=?, gender=?, course=?,"
					+ " address=?, mno=?, pwd=?, sem=? where sid=" + dto.getSid();
			ps = conn.prepareStatement(query);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getEno());
			ps.setString(3, dto.getGender());
			ps.setString(4, dto.getCourse());
			ps.setString(5, dto.getAddress());
			ps.setString(6, dto.getMno());
			ps.setString(7, Password.encrypt(dto.getPwd()));
			ps.setInt(8, dto.getSem());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("+++Exception in updateStudent: " + e);
		} finally {
			ps = null;
			rs = null;
			conn = null;
			return flag;
		}
	}

	public boolean deleteStudent(int sid) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = FeeDB.getConnection();
			}
			String query = "delete from student_master where sid=" + sid;
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("+++Exception in deleteStudent: " + e);
		} finally {
			ps = null;
			rs = null;
			conn = null;
			return flag;
		}
	}

	public StudentDTO getStudent(int sid) {
		StudentDTO dto = null;
		try {
			if (conn == null) {
				conn = FeeDB.getConnection();
			}
			String query = "select * from student_master where sid=" + sid;
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			if (rs.next()) {
				dto = new StudentDTO();
				dto.setAddress(rs.getString("address"));
				dto.setCourse(rs.getString("course"));
				dto.setDue(rs.getFloat("due"));
				dto.setEno(rs.getString("eno"));
				dto.setFee(rs.getFloat("fee"));
				dto.setGender(rs.getString("gender"));
				dto.setMno(rs.getString("mno"));
				dto.setName(rs.getString("name"));
				dto.setPaid(rs.getFloat("paid"));
				System.out.println(Password.decrypt(rs.getString("pwd")));
				dto.setPwd(Password.decrypt(rs.getString("pwd")));
				dto.setSem(rs.getInt("sem"));
				dto.setSid(rs.getInt("Sid"));
			}
		} catch (Exception e) {
			System.out.println("+++Exception in getStudent: " + e);
		} finally {
			ps = null;
			rs = null;
			conn = null;
			return dto;
		}
	}

	public ArrayList<StudentDTO> getAllStudents() {
		ArrayList<StudentDTO> al = new ArrayList<>();
		StudentDTO dto = null;
		try {
			if (conn == null) {
				conn = FeeDB.getConnection();
			}
			String query = "select * from student_master";
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				dto = new StudentDTO();
				dto.setAddress(rs.getString("address"));
				dto.setCourse(rs.getString("course"));
				dto.setDue(rs.getFloat("due"));
				dto.setEno(rs.getString("eno"));
				dto.setFee(rs.getFloat("fee"));
				dto.setGender(rs.getString("gender"));
				dto.setMno(rs.getString("mno"));
				dto.setName(rs.getString("name"));
				dto.setPaid(rs.getFloat("paid"));
				dto.setPwd(Password.decrypt(rs.getString("pwd")));
				dto.setSem(rs.getInt("sem"));
				dto.setSid(rs.getInt("Sid"));
				al.add(dto);
			}
		} catch (Exception e) {
			System.out.println("+++Exception in getAllStudents: " + e);
		} finally {
			ps = null;
			rs = null;
			conn = null;
			return al;
		}
	}

	public StudentDTO getStudentByEno(String eno) {
		StudentDTO dto = null;
		try {
			if (conn == null) {
				conn = FeeDB.getConnection();
			}
			String query = "select * from student_master where eno='" + eno + "'";
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			if (rs.next()) {
				dto = new StudentDTO();
				dto.setAddress(rs.getString("address"));
				dto.setCourse(rs.getString("course"));
				dto.setDue(rs.getFloat("due"));
				dto.setEno(rs.getString("eno"));
				dto.setFee(rs.getFloat("fee"));
				dto.setGender(rs.getString("gender"));
				dto.setMno(rs.getString("mno"));
				dto.setName(rs.getString("name"));
				dto.setPaid(rs.getFloat("paid"));
				dto.setPwd(Password.decrypt(rs.getString("pwd")));
				dto.setSem(rs.getInt("sem"));
				dto.setSid(rs.getInt("Sid"));
			}
		} catch (Exception e) {
			System.out.println("+++Exception in getStudent: " + e);
		} finally {
			ps = null;
			rs = null;
			conn = null;
			return dto;
		}
	}

	public String checkStudent(String eno, String pwd) {
		String name = null;
		try {
			if (conn == null) {
				conn = FeeDB.getConnection();
			}
			String query = "select name from student_master where eno=? and pwd=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, eno);
			ps.setString(2, pwd);
			rs = ps.executeQuery();
			if (rs.next()) {
				name = rs.getString("name");
			}
		} catch (Exception e) {
			System.out.println("+++Exception in checkStudent: " + e);
		} finally {
			ps = null;
			rs = null;
			conn = null;
			return name;
		}
	}
	
	public boolean payFee(StudentDTO dto) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = FeeDB.getConnection();
			}
			String query = "update student_master set fee=?, paid=?, due=? where sid=" + dto.getSid();
			ps = conn.prepareStatement(query);
			ps.setFloat(1, dto.getFee());
			ps.setFloat(2, dto.getPaid());
			ps.setFloat(3, dto.getDue());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("+++Exception in payFee: " + e);
		} finally {
			ps = null;
			rs = null;
			conn = null;
			return flag;
		}
	} 
}
