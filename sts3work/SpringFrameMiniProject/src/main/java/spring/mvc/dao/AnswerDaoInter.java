package spring.mvc.dao;

import java.util.List;

import spring.mvc.dto.AnswerDto;

public interface AnswerDaoInter {
	public void insertAnswer(AnswerDto dto);
	public List<AnswerDto> getAllAnswers(int num);
}
