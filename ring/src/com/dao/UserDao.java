package com.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
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
				+ " user_no = '" + user.getUserNo() + "' and pwd = '" + user.getPwd() + "' " ;
		jdbcTemplate.query(sql, new RowMapper() {
			public Object mapRow(ResultSet rs, int arg1) throws SQLException {
					user.setId(rs.getInt("id"));
					user.setUserNo(rs.getString("user_no"));
					user.setUserName(rs.getString("user_name"));
					user.setRoleId(rs.getString("role"));
				 return null ;
			}
		});
		return user;
	}

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public int queryTotal(User user) {
		String sql = "select count(*) total from a_user u , a_agent a where u.agentid = a.id  " + whereSql(user);
         final  Integer[] arr =  {0};
         jdbcTemplate.query(sql, new RowMapper() {
			public Object mapRow(ResultSet rs, int arg1) throws SQLException {
					arr[0] = rs.getInt("total");
				 return null ;
			}
		});
		return arr[0];
	}
	
	public void insert(final User user) {
		jdbcTemplate.update("insert into a_user (userno ,username , pwd , roleid , agentid  ) values(?,?,?,?,?)",   
                new PreparedStatementSetter(){  
              
                    @Override  
                    public void setValues(PreparedStatement ps) throws SQLException {  
                        ps.setString(1,  user.getUserNo());  
                        ps.setString(2, user.getUserName()); 
                        ps.setString(3, user.getPwd());
                        ps.setString(4 , user.getRoleId());
                    }  
        });  
	}

	public void update(final User user) {
		jdbcTemplate.update("update a_user set  pwd = ?  where id = ? ",   
                new PreparedStatementSetter(){  
                    @Override  
                    public void setValues(PreparedStatement ps) throws SQLException {  
                        ps.setString(1, user.getPwd()); 
                        ps.setInt(2, user.getId());
                    }  
        });
	}
	
	public void delete(Integer id) {
		 jdbcTemplate.update(  
	                "delete from a_user where agentid = ?",   
	                new Object[]{id},   
	                new int[]{java.sql.Types.INTEGER});  
	}
	
	public String whereSql(User user){
		String sql = "";
		if(StringUtils.isNotEmpty(user.getUserNo())){
			sql += " and   userno  like  '%" + user.getUserNo() + "%' ";
		}
		if(StringUtils.isNotEmpty(user.getUserName())){
			sql += " and   a.name  like  '%" + user.getUserName() + "%' ";
		}
		if(StringUtils.isNotEmpty(user.getRoleId())){
			sql += " and   u.roleid =  '" + user.getRoleId() + "' ";
		}
		if(user.getId()!=null && StringUtils.isNotEmpty(user.getId()+"")){
			sql += " and   u.id =  '" + user.getId() + "' ";
		}
		return sql;
	}
}
