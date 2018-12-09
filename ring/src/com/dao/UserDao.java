package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.model.Customer;
import com.model.User;


@Repository
public class UserDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public User checkUser(final User user) {
		String sql = "select * from t_user a where "
				+ " ( user_no = '"+ user.getUserNo()+"'  or user_no = "
						+ "(select openid from t_customer where telephone = '"+user.getUserNo()+"') )"
								+ " and pwd = '" + user.getPwd() + "' " ;
		jdbcTemplate.query(sql, new RowMapper() {
			public Object mapRow(ResultSet rs, int arg1) throws SQLException {
					user.setId(rs.getInt("id"));
					user.setUserNo(rs.getString("user_no"));
					user.setUserName(rs.getString("user_name"));
					user.setRole(rs.getString("role"));
					user.setRemark(rs.getString("remark"));
				 return null ;
			}
		});
		return user;
	}

	public int checkUnique(String userNo) {
		String sql = "select count(*) from t_user a where "
				+ " user_no = '" + userNo + "'  " ;
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

	public void updateExamine(String table, String column, String state, Integer id ) {
		String sql = "update t_" + table +  " set " + column  + " = '" + state + "' where id =" + id  ;
		jdbcTemplate.update(sql);
		
	}

	public void examineFail(String table , String column,String state ,  String remark, Integer id) {
		String sql = "update t_" + table +  " set remark = '" + remark + "' , "+ column  + " = '" + state +"'  where id =" + id  ;
		jdbcTemplate.update(sql);
	}

}
