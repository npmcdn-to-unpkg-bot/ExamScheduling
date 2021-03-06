package iii.team05.job.model;

import java.util.*;
import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import iii.team05.job.model.JobVO;

public class Job111DAO implements JobDAO_interface {

	// 一個應用程式中,針對一個資料庫 ,共用一個DataSource即可
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/ESDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "INSERT INTO Job (jobname, jobcolor, jobactive) VALUES (?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT jobid, jobname, jobcolor, jobactive FROM Job";
	private static final String GET_ONE_STMT = "SELECT jobid, jobname, jobcolor, jobactive FROM Job where jobid = ?";
	private static final String DELETE_STMT = "DELETE FROM Job where jobid = ?";
	private static final String UPDATE_STMT = "UPDATE Job set jobname=?, jobcolor=?, jobactive=? where jobid = ?";

	@Override
	public void insert(JobVO jobVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, jobVO.getJobname());
			pstmt.setString(2, jobVO.getJobcolor());
			pstmt.setBoolean(3, jobVO.getJobactive());

			pstmt.executeUpdate();

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void update(JobVO jobVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STMT);

			pstmt.setString(1, jobVO.getJobname());
			pstmt.setString(2, jobVO.getJobcolor());
			pstmt.setBoolean(3, jobVO.getJobactive());
			pstmt.setInt(4, jobVO.getJobid());

			pstmt.executeUpdate();

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void delete(Integer jobid) {
		int updateCount_EMPs = 0;

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			
			pstmt = con.prepareStatement(DELETE_STMT);
			pstmt.setInt(1, jobid);
			updateCount_EMPs = pstmt.executeUpdate();
			
			System.out.println("刪除事件id＝" + jobid +"有"+ updateCount_EMPs
					+ "筆被刪除");
			
			// Handle any SQL errors
		} catch (SQLException se) {
			if (con != null) {
				try {
					// 3●設定於當有exception發生時之catch區塊內
					con.rollback();
				} catch (SQLException excep) {
					throw new RuntimeException("rollback error occured. "
							+ excep.getMessage());
				}
			}
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public JobVO findByPrimaryKey(Integer jobid) {

		JobVO jobVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, jobid);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				jobVO = new JobVO();
				jobVO.setJobid(rs.getInt("jobid"));
				jobVO.setJobname(rs.getString("jobname"));
				jobVO.setJobcolor(rs.getString("jobcolor"));
				jobVO.setJobactive(rs.getBoolean("jobactive"));
				
			}

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return jobVO;
	}

	@Override
	public List<JobVO> getAll() {
		List<JobVO> list = new ArrayList<JobVO>();
		JobVO jobVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				jobVO = new JobVO();
				jobVO.setJobid(rs.getInt("jobid"));
				jobVO.setJobname(rs.getString("jobname"));
				jobVO.setJobcolor(rs.getString("jobcolor"));
				jobVO.setJobactive(rs.getBoolean("jobactive"));
				list.add(jobVO); // Store the row in the list
			}

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}
	
	@Override
	public int insert_return_id(JobVO jobVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT, Statement.RETURN_GENERATED_KEYS);

			pstmt.setString(1, jobVO.getJobname());

			pstmt.executeUpdate();
			
			int autoIncKeyFromApi = -1;
		    ResultSet rs = pstmt.getGeneratedKeys();
		    if (rs.next()) {
		      autoIncKeyFromApi = rs.getInt(1);
		    }
		    return autoIncKeyFromApi;
			
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}


	@Override
	public void delete_VO(JobVO jobVO) {
		// TODO Auto-generated method stub
		
	}

}
