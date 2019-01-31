package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.model.User;


@Repository
public class UserDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public User checkUser(final User user) {
		String sql = "select * from t_user a where "
				+ " ( remark = '"+ user.getRemark()+"'  or user_no = '" +user.getUserNo()  + "' )"
								+ "  and pwd = '" + user.getPwd() + "' " ;
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

	public int checkInviteState(Integer id) {
		String sql = "select count(1) from t_invite where "
				+ " (from_id = "+id+" and invite_states in ('1','4' , '6') ) "
				+ " or (join_id = "+id+" and invite_states in ('4' , '6') ) " ;
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

}
