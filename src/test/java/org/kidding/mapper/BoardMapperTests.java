package org.kidding.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kidding.domain.PageParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Setter(onMethod_=@Autowired)
	private BoardMapper mapper;
	
	@Test
	public void TestList() {
		
		PageParam param = new PageParam();
		param.setTotal(329);
		param.setPage(3);
		log.info(mapper.getList(param));
	}
	
}
