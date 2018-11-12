package techsolutions.accountant;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import techsolutions.db.FeeDB;
import techsolutions.util.Password;

public class AccountantDAO {
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	public boolean addAccountant(AccountantDTO dto) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = FeeDB.getConnection();
			}
			String query = "insert into accountant_master(name, email, pwd, address, mno) values(?,?,?,?,?)";
			ps = conn.prepareStatement(query);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getEmail());
			ps.setString(3, Password.encrypt(dto.getPwd()));
			ps.setString(4, dto.getAddress());
			ps.setString(5, dto.getMno());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("+++Exception in addAccountant: " + e);
		} finally {
			ps = null;
			rs = null;
			conn = null;
			return flag;
		}
	}

	public boolean updateAccountant(AccountantDTO dto) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = FeeDB.getConnection();
			}
			String query = "update accountant_master set name=?, email=?, pwd=?, address=?, mno=? where aid=" + dto.getAid();
			ps = conn.prepareStatement(query);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getEmail());
			ps.setString(3, Password.encrypt(dto.getPwd()));
			ps.setString(4, dto.getAddress());
			ps.setString(5, dto.getMno());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("+++Exception in updateAccountant: " + e);
		} finally {
			ps = null;
			rs = null;
			conn = null;
			return flag;
		}
	}

	public boolean deleteAccountant(int aid) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = FeeDB.getConnection();
			}
			String query = "delete from accountant_master where aid=" + aid;
			ps=conn.prepareStatement(query);
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("+++Exception in deleteAccountant: " + e);
		} finally {
			ps = null;
			rs = null;
			conn = null;
			return flag;
		}
	}

	public AccountantDTO getAccountant(int aid) {
		AccountantDTO dto = null;
		try {
			if (conn == null) {
				conn = FeeDB.getConnection();
			}
			String query = "select * from accountant_master where aid=" + aid;
			ps = conn.prepareStatement(query);
			rs=ps.executeQuery();
			if (rs.next()) {
				dto = new AccountantDTO();
				dto.setAddress(rs.getString("address"));
				dto.setAid(rs.getInt("aid"));
				dto.setEmail(rs.getString("email"));
				dto.setMno(rs.getString("mno"));
				dto.setName(rs.getString("name"));
				System.out.print(rs.getString("email")+" : ");
				System.out.println(Password.decrypt(rs.getString("pwd")));
				dto.setPwd(Password.decrypt(rs.getString("pwd")));
			}
		} catch (Exception e) {
			System.out.println("+++Exception in getAccountant: " + e);
		} finally {
			ps = null;
			rs = null;
			conn = null;
			return dto;
		}
	}
	
	public ArrayList<AccountantDTO> getAllAccountant(){
		ArrayList<AccountantDTO> al = new ArrayList<>();
		AccountantDTO dto = null;
		try {
			if (conn == null) {
				conn = FeeDB.getConnection();
			}
			String query = "select * from accountant_master";
			ps = conn.prepareStatement(query);
			rs=ps.executeQuery();
			while (rs.next()) {
				dto = new AccountantDTO();
				dto.setAddress(rs.getString("address"));
				dto.setAid(rs.getInt("aid"));
				dto.setEmail(rs.getString("email"));
				dto.setMno(rs.getString("mno"));
				dto.setName(rs.getString("name"));
				dto.setPwd(Password.decrypt(rs.getString("pwd")));
				al.add(dto);
			}
		} catch (Exception e) {
			System.out.println("+++Exception in getAllAccountant: " + e);
		} finally {
			ps = null;
			rs = null;
			conn = null;
			return al;
		}
	}
	
	public int checkAccountant(String email, String pwd) {
		int aid = 0;
		try {
			if (conn == null) {
				conn = FeeDB.getConnection();
			}
			String query = "select aid from accountant_master where email=? and pwd=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, Password.encrypt(pwd));
			rs = ps.executeQuery();
			if (rs.next()) {
				aid = rs.getInt("aid");
			}
		} catch (Exception e) {
			System.out.println("+++Exception in checkAccountant: " + e);
		} finally {
			ps = null;
			rs = null;
			conn = null;
			return aid;
		}
	}
}
