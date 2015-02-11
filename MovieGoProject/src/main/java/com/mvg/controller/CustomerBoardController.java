package com.mvg.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mvg.entity.CustomerBoard;
import com.mvg.service.CustomerBoardService;

@Controller
@RequestMapping("/board")
public class CustomerBoardController {

	@Autowired
	CustomerBoardService service;
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String boardList(Model model){
		List<CustomerBoard> lists = service.getAllBoardList();
		model.addAttribute("lists", lists);
		return "board/board_list";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String boardWrite(){
		return "board/board_write";
	}
	
	@RequestMapping(value="/submit", method=RequestMethod.POST)
	public String boardSubmit(@ModelAttribute("board") CustomerBoard board){
		service.addBoard(board);
		return "redirect:/board/";
	}
	
	@RequestMapping(value="/view", method=RequestMethod.GET)
	public String showContent(@RequestParam int boardId, Model model){
		
		return "board/board_view";
	}
}