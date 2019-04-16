package org.kidding.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kidding.domain.BoardVO;
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
	
	@Setter(onMethod_=@Autowired)
	private ReplyMapper remapper;
	
	@Test
	public void testChart() {
		log.info(mapper.getChart());
	}
	
	@Test
	public void testMapper() {
		log.info(remapper);
	}
	
	@Test
	public void TestList() {
		
		PageParam param = new PageParam();
		param.setTotal(329);
		param.setPage(3);
		log.info(mapper.getList(param));
	}
	
	@Test
	public void insert() {
		
		BoardVO vo = new BoardVO();
		vo.setTitle("랄랄랄라");
		vo.setWriter("가무새");
		vo.setContent("왜 안될가?");
		
		log.info(mapper.register(vo));
	}

	@Test
	public void testRead() {
		
		PageParam param = new PageParam();
		param.setBno(269);
		
		log.info(mapper.getRead(param));
//		mapper.getList(param).forEach(board -> log.info(board));
	}
	
	@Test
	public void updateTest() {
		
		BoardVO vo = new BoardVO();
		vo.setTitle("수정합니다 수정");
		vo.setContent("가무새 수정본");
		vo.setBno(269);
		
		log.info(mapper.modify(vo));
//		mapper.getList(param).forEach(board -> log.info(board));
	}
	
//	@Test
//	public void testSearch() {
//		
//		PageParam pageParam = new PageParam();
//		
//		pageParam.setType("w");
//		pageParam.setKeyword("fasdgaf");
//		
//		pageParam.setExtend(false);
//		
//		log.info(mapper.getList(pageParam));
//		log.info(mapper.getTotal(pageParam));
//	}
}
