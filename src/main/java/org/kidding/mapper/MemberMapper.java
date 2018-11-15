package org.kidding.mapper;

import org.apache.ibatis.annotations.Select;
import org.kidding.domain.MemberVO;

public interface MemberMapper {
	
	@Select("select now()")
	public String getTime();
	
	public MemberVO getMember(String uid);
	
	
	
}
