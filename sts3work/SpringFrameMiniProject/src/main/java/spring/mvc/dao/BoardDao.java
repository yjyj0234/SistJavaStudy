package spring.mvc.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.dto.BoardDto;

@Repository
public class BoardDao implements BoardDaoInter {
	@Autowired
	SqlSession session;
	
	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return session.selectOne("TotalCountOfBoard");
	}

	@Override
	public int getMaxNum() {
		// TODO Auto-generated method stub
		return session.selectOne("MaxNumOfBoard");
	}

	@Override
	public void updateRestep(int regroup, int restep) {
		// TODO Auto-generated method stub
					//regroup,restep�� int�� integer�� ����
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		
		map.put("regroup", regroup);
		map.put("restep", restep);
		
		session.update("updateStepOfBoard",map);
	}

	@Override
	public void insertBoard(BoardDto dto) {
		//�Ѿ�� �ϴ°� ����
		int num=dto.getNum();		//0:����  1�̻�:���
		int regroup=dto.getRegroup();
		int restep=dto.getRestep();
		int relevel=dto.getRelevel();
		
		//�� ���� ���
		if(num==0) {
			regroup=getMaxNum()+1;
			restep=0;
			relevel=0;
		}else {
			//�����׷� �� ���޹��� restep���� ū�۵��� ��� +1
			this.updateRestep(regroup, restep);
			//���޹��� step,level+1
			restep++;
			relevel++;
		}
		//�ٲﰪ���� �ٽ� dto�� ��´�
		dto.setRegroup(regroup);
		dto.setRestep(restep);
		dto.setRelevel(relevel);
		
		session.insert("InsertOfBoard", dto);
	}

	@Override
	public List<BoardDto> getList(int start, int perpage) {
		// TODO Auto-generated method stub
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		
		map.put("start", start);
		map.put("perpage", perpage);
		
		return session.selectList("SelectPagingOfBoard", map);
	}

	@Override
	public BoardDto getOneData(int num) {
		// TODO Auto-generated method stub
		
		return session.selectOne("selectOneOfBoard", num);
	}

	@Override
	public void updateReadCount(int num) {
		// TODO Auto-generated method stub
		session.update("updateReadCountOfBoard", num);
	}

	@Override
	public void updateBoard(BoardDto dto) {
		// TODO Auto-generated method stub
		session.update("updateOfBoard",dto);
	}

	@Override
	public void deleteBoard(int num) {
		// TODO Auto-generated method stub
		session.delete("deleteOfBoard", num);
	}

}
