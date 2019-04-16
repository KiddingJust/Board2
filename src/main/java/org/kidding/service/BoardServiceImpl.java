package org.kidding.service;

import java.util.List;

import org.kidding.domain.BoardAttachVO;
import org.kidding.domain.BoardVO;
import org.kidding.domain.ChartVO;
import org.kidding.domain.PageParam;
import org.kidding.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class BoardServiceImpl implements BoardService {

	@Setter(onMethod_=@Autowired)
	private BoardMapper mapper;
	
	@Override
	public List<BoardVO> getList(PageParam param) {
		return mapper.getList(param);
	}
	@Override
	public BoardVO getRead(PageParam param) {
		return mapper.getRead(param);
	}
	
	@Override
	public int getTotal(PageParam param) {
		return mapper.getTotal(param);
	}

//	@Override
//	public int register(BoardVO vo) {
//		
//		int result = mapper.register(vo);
//		   
//		  if(vo.getAttachList() == null || vo.getAttachList().size() <= 0) {
//		         return result;
//		      }
//		
//		vo.getAttachList().forEach(attach -> {
//			attach.setBno(vo.getBno());
//		});
//		
//		return mapper.register(vo);
//	}
	
       
	@Transactional
	@Override
	public int register(BoardVO board) {
	      
		int result = mapper.register(board);
	      
		if(board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return result;
			}
	      
	    board.getAttachList().forEach(attach ->{
	    	log.info(attach);
	    	attach.setBno(board.getBno());
	         mapper.insert(attach);
	    });
	    return result;
	}
	
	
	@Transactional
	@Override
	public int modify(BoardVO vo) {
		
		mapper.deleteAll(vo.getBno());
		
		if(vo.getAttachList() == null) {
			return mapper.modify(vo);
		}
		
		if(vo.getAttachList().size() > 0) {
			vo.getAttachList().forEach(attach -> {
			attach.setBno(vo.getBno());
			mapper.insert(attach);
			});		

		}
		return mapper.modify(vo);
	}
	
	
	@Override
	public int delete(PageParam param) {
		return mapper.delete(param);
	}
	
	@Override
	public List<BoardAttachVO> getAttachList(int bno) {
		
		log.info("get Attach list by bno" + bno);
		
		return mapper.findByBno(bno);
	}
	
	//첨부파일 삭제와 게시물 삭제 같이 되도록 처리)
	@Transactional
	@Override
	public boolean deleteAll(PageParam param) {

		log.info("deleteAll..." + param.getBno());
		mapper.deleteAll(param.getBno());
		return mapper.delete(param) == 1;
	}
	@Override
	public List<ChartVO> getChart() {
		log.info("chart를 불러옵니다....");
		
		return mapper.getChart();
	}

	


	
}
