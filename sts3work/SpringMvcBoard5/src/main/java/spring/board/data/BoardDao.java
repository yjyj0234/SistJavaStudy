package spring.board.data;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//xml�� dao�� �ڵ����� ������ ���
@Repository
public class BoardDao implements BoardDaoInter {

//�ڵ�����
	@Autowired
	private SqlSession session;
	
	@Override
	public int getTotalCount() {

		// boardMapper.xml���� ��� id�� �ֱ�
		return session.selectOne("selectCountOfBoard");
	}
	
	@Override
	public void insertBoard(BoardDto dto) {
		session.insert("insertOfBoard", dto);
	}

	@Override
	public List<BoardDto> getAllDatas() {
		// TODO Auto-generated method stub
		return session.selectList("selectAllOfBoard");
	}

	@Override
	public BoardDto getOneData(String num) {
		// TODO Auto-generated method stub
		return session.selectOne("selectOneDataOfBoard", num);
	}

	@Override
	public void updateBoard(BoardDto dto) {
		// TODO Auto-generated method stub
		session.update("updateDataOfBoard",dto);
		
	}

	@Override
	public void deleteBoard(String num) {
		// TODO Auto-generated method stub
		session.delete("deleteDataOfBoard",num);
	}
}
