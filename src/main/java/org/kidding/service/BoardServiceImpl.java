package org.kidding.service;

import java.util.List;

import org.kidding.domain.BoardVO;
import org.kidding.domain.PageParam;
import org.kidding.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	
	@Override
	public int modify(BoardVO vo) {
		return mapper.modify(vo);
	}
	@Override
	public int delete(PageParam param) {
		return mapper.delete(param);
	}




	
}
