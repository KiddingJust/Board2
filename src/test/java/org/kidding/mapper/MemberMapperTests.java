package org.kidding.mapper;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kidding.domain.MemberVO;
import org.kidding.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class MemberMapperTests {
	
	@Setter(onMethod_= @Autowired)
	private PasswordEncoder pwEncoder;

	@Setter(onMethod_= @Autowired)
	private DataSource ds;
	
	@Setter(onMethod_= @Autowired)
	private MemberMapper mapper;
	
	@Test
	public void testTime() {
		log.info(mapper.getTime());
	}
	
	@Test
	public void testAuth() {
		MemberVO vo = mapper.getMember("user95");
		log.info(vo);
	}
	
	@Test
	public void testInsertAuth() {
		String sql = "insert into tbl_member_auth (userid, auth) values(?, ?)";
		
		for(int i = 90; i < 100; i++) {
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,  "user" + i);
				pstmt.setString(2,  "ROLE_ADMIN");


				log.info(pstmt.executeUpdate());
				
			} catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt != null) {try {pstmt.close();}catch(Exception e) {}}
				if(con != null) {try {con.close();}catch(Exception e) {}}
			}//end finally
		}
	}
	
	@Test
	public void testInsertMember() {
		//데이터 소스 아무 문제없이 가져오는지 check
		log.info(ds);
		
		String sql = "insert into tbl_member (userid, userpw, username) values(?, ?, ?)";
		
		for(int i = 0; i<100; i++) {
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,  "user" + i);
				pstmt.setString(2,  pwEncoder.encode("pw" + i));
				pstmt.setString(3,  "사용자" + i);

				log.info(pstmt.executeUpdate());
				
			} catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt != null) {try {pstmt.close();}catch(Exception e) {}}
				if(con != null) {try {con.close();}catch(Exception e) {}}
			}//end finally
		}//end for
	}
	
	@Test
	public void test1() {
		log.info("pwEncoder");
		
		String enPw = pwEncoder.encode("member");
		
		//암호화했음 
		log.info(enPw);		
	}
	

}