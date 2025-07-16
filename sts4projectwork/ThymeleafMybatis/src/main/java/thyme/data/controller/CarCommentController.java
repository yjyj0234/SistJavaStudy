package thyme.data.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import thyme.data.dto.CarCommentDto;
import thyme.data.dto.CarDto;
import thyme.data.repository.CarCommentDao;

@RestController
@RequiredArgsConstructor   //final not null 변수만 자동주입 가능
public class CarCommentController {
	private final CarCommentDao commentDao;
	
	@GetMapping("/board/addcomment")
	public void addComment(@RequestParam("num") Long num,
			@RequestParam("comment") String comment) {
		//먼저 carDto에 num값을 넣고 carcommentdto에 넣는다(외부키로 지정된값)
		CarDto dto=CarDto.builder().num(num).build();
		
		//dto에 값을 지정
		CarCommentDto commentDto=CarCommentDto.builder()
				.comment(comment)
				.car(dto)
				.build();
		
		//insert
		commentDao.insertCommentCar(commentDto);
	}
	//특졍글에 달린 댓글 반환
	@GetMapping("/board/commentlist")
	public List<CarCommentDto> commentList(@RequestParam("num") Long num){
		return commentDao.getJpaCarCommentList(num);
	}
}
