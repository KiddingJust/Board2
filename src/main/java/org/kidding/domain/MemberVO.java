package org.kidding.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

//이전까진 jdbc를 통한 연결. 이제 UserDetailsService 통해 DB 연결해보자. 

@Data
public class MemberVO {
	
	private String userid, userpw, username;
	private boolean enabled;
	private Date regdate, updatedate;
	
	private List<AuthVO> authList;
	
}
