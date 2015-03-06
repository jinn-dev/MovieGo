package com.mvg.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.mvg.entity.Comment;
import com.mvg.entity.CustomerBoard;
import com.mvg.service.CommentService;
import com.mvg.service.CustomerBoardService;

@Controller
@RequestMapping("/board")
@SessionAttributes({ "content", "detail" })
public class CustomerBoardController {
	private static final Logger logger = LoggerFactory
			.getLogger(CustomerBoardController.class);

	@Autowired
	CustomerBoardService service;

	@Autowired
	CommentService cmtservice;

	/* 게시판 리스트 */
	@RequestMapping(method = RequestMethod.GET)
	public String boardList(Model model) {
		List<CustomerBoard> list = service.getAllBoardList();
		model.addAttribute("list", list);
		return "board/board_list";
	}
	

	/*@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public String boardList(Model model, SessionStatus sessionStatus) {
		List<CustomerBoard> list = service.getAllBoardList();
		model.addAttribute("list", list); // list는 게시판 글 전체 객체
		sessionStatus.setComplete(); // sesseion에서 detail 객체 삭제
		return "board/board_list";
	}*/

	/* 게시판 글보기 */
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String showContent(@RequestParam int boardId, Model model) {
		CustomerBoard board = service.getBoardByBdId(boardId);
		List<Comment> comment = cmtservice.getCommentByBoardId(boardId);
		// CustomerBoard board = service.getBoardByBdIdWithCmts(boardId);
		model.addAttribute("board", board); 
		model.addAttribute("comment", comment);
		return "board/board_view";
	}
	
	
	/* 게시판 글쓰기 */
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String boardWrite() {
		return "board/board_write";
	}

	@RequestMapping(value = "/submit", params = "_event_confirmed", method = RequestMethod.POST)
	public String boardSubmit(@ModelAttribute("board") CustomerBoard board) {
		service.addBoard(board);
		return "redirect:/board";
	}

	/* 게시판 글수정 */
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String redirToEntryForm(@RequestParam int boardId, Model model) {
		CustomerBoard content = service.getBoardByBdId(boardId);
		model.addAttribute("content", content); // content는 게시판 글 수정한거 객체
		return "board/board_modify";
	}

	@RequestMapping(value = "/modified", method = RequestMethod.POST)
	public String boardmodified(@ModelAttribute("content") CustomerBoard board) {
		service.modifyBoard(board);
		String path = "redirect:/board/review?boardId=" + board.getBoardId();
		return path;
	}

	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public String redirToList(@RequestParam int boardId, Model model,
			SessionStatus sessionStatus) {
		sessionStatus.setComplete(); // sesseion에서 content 객체 삭제
		CustomerBoard board = service.getBoardByBdIdWithCmts(boardId);
		model.addAttribute("detail", board); // detail은 게시판 글+코멘트 하나 객체
		return "board/board_view";
	}

	/* 게시판 글삭제 */
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String boardDelete(@RequestParam int boardId) {
		service.deleteBoard(boardId);
		return "redirect:/board";
	}
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String getRestaurantListbyName(@RequestParam String boardTitle, Model model){
		List<CustomerBoard> list = (List<CustomerBoard>)service.boardListByTitle(boardTitle);
		model.addAttribute("list", list);
		
		return "board/board_list";
		
	}
}