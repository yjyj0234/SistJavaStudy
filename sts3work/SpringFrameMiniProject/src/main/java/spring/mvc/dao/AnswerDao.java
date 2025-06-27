package spring.mvc.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.dto.AnswerDto;

@Repository
public class AnswerDao implements AnswerDaoInter {
	
	@Autowired
	SqlSession session;
	
	@Override
	public void insertAnswer(AnswerDto dto) {
		// TODO Auto-generated method stub
		session.insert("insertOfAnswer", dto);
	}

	@Override
	public List<AnswerDto> getAllAnswers(int num) {
		// TODO Auto-generated method stub
		return session.selectList("selectAllOfAnswer",num);
	}

}
