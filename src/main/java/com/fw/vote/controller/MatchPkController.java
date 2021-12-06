package com.fw.vote.controller;

import java.util.List;
import java.util.Map;

import com.fw.vote.model.Course;
import com.fw.vote.model.Match;
import com.fw.vote.model.MatchPk;
import com.fw.vote.model.Player;
import com.fw.vote.service.CourseService;
import com.fw.vote.service.MatchPkService;
import com.fw.vote.service.MatchService;
import com.fw.vote.service.PlayerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("Mpk")
public class MatchPkController {
	
	@Autowired
	MatchPkService matchPkService;
	
	@Autowired
	PlayerService playerService;
	
	@Autowired
	MatchService matchService;

	@Autowired
	CourseService courseService;
	
	@RequestMapping("/selectMatchPk")
	public ModelAndView selectMatchPk(MatchPk matchPk, ModelAndView mv, Player player, Match match){
		//List<MatchPk> matchPkList=matchPkService.selectMatchPk(matchPk);
		List<Player> playerList=playerService.select(player);
		mv.addObject("playerList", playerList);
		List<Match> matchList=matchService.select(match);
		mv.addObject("matchList", matchList);
		List<Map<String,String>> matchPkList=matchPkService.selectMatchPkMap(matchPk);
		mv.setViewName("selectMatchPk1");
		mv.addObject("matchPkList", matchPkList);
		return mv;
	}
	
	@RequestMapping("/addMatchPk")
	public ModelAndView addMatchPk(MatchPk matchPk,ModelAndView mv,Player player, Match match){
		List<Player> playerList=playerService.select(null);
		mv.addObject("playerList", playerList);
		List<Match> matchList=matchService.select(match);
		mv.addObject("matchList", matchList);
		List<Course> courseList=courseService.select(null);
		mv.addObject("courseList", courseList);
		mv.setViewName("addMatchPk1");
		return mv;
	}

	@RequestMapping("/saveMatchPk")
	public String saveMatchPk(MatchPk matchPk,ModelAndView mv,Player player){
		List<Player> playerList=playerService.select(player);
		mv.addObject("playerList", playerList);
		matchPk.setFirstTicketCount(0);
		matchPk.setSecondTicketCount(0);
		matchPk.setBattleFlag("0");
		matchPkService.insertMatchPk(matchPk);
		 return "redirect:selectMatchPk";
	}
	@RequestMapping("/updateMatchPk")
	public ModelAndView matchPkDao(ModelAndView mv,Player player,Match match,String battleId){
		List<Player> playerList=playerService.select(player);
		mv.addObject("playerList", playerList);
		List<Match> matchList=matchService.select(match);
		mv.addObject("matchList", matchList);
		MatchPk matchPk=matchPkService.selectById(battleId);
		mv.addObject("matchPk", matchPk);
		List<Course> courseList=courseService.select(null);
		mv.addObject("courseList", courseList);
		mv.setViewName("updateMatchPk1");
		return mv;
	}
	
	@RequestMapping("/saveuMatchPk")
	public String saveuMatchPk(ModelAndView mv,MatchPk matchPk){
		matchPkService.updateMatchPk(matchPk);
		return "redirect:selectMatchPk";
	}
	
}
