package com.fw.vote.controller;

import com.fw.vote.model.Match;
import com.fw.vote.model.MatchPkInfo;
import com.fw.vote.model.Player;
import com.fw.vote.model.User;
import com.fw.vote.service.MatchPkInfoService;
import com.fw.vote.service.MatchService;
import com.fw.vote.service.PlayerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.*;

import static sun.audio.AudioPlayer.player;

@Controller
@RequestMapping("pk")
public class MatchPkInfoController {
    @Autowired
    MatchPkInfoService matchPkInfoService;

    @Autowired
    PlayerService playerService;

    @Autowired
    MatchService matchService;




    @RequestMapping("listpk")
    public ModelAndView select(MatchPkInfo matchPkInfo, ModelAndView mv, HttpSession session ){
        User user= (User) session.getAttribute("user");
        if(user==null){
            mv.setViewName("login");
            return mv;
        }
        matchPkInfo.setGrade(user.getGrade());
        List<MatchPkInfo> matchPkList=matchPkInfoService.selectListByGradeAndMatchId(matchPkInfo);
        mv.addObject("matchList", matchPkList);
        mv.setViewName("voteList");
        return mv;
    }

    @RequestMapping("/selectMatchPk")
    public ModelAndView selectMatchPk(MatchPkInfo matchPkInfo, ModelAndView mv, Player player, Match match){
        //List<MatchPk> matchPkList=matchPkService.selectMatchPk(matchPk);
        List<Player> playerList=playerService.select(player);
        mv.addObject("playerList", playerList);
        List<Match> matchList=matchService.select(match);
        mv.addObject("matchList", matchList);
        List<MatchPkInfo> matchPkList=matchPkInfoService.selectMatchPkInfo(matchPkInfo);
        mv.setViewName("selectMatchPk");
        mv.addObject("matchPkList", matchPkList);
        return mv;
    }

    @RequestMapping("/addMatchPk")
    public ModelAndView addMatchPk(MatchPkInfo matchPkInfo,ModelAndView mv,Player player, Match match){
        List<Player> playerList=playerService.select(player);
        mv.addObject("playerList", playerList);
        List<Match> matchList=matchService.select(match);
        mv.addObject("matchList", matchList);
        matchPkInfoService.insert(matchPkInfo);
        mv.setViewName("addMatchPk");
        return mv;
    }

    @RequestMapping("/updateMatchPk")
    public ModelAndView matchPkDao(ModelAndView mv,Player player,Match match,String battleId){
        List<Player> playerList=playerService.select(player);
        mv.addObject("playerList", playerList);
        List<Match> matchList=matchService.select(match);
        mv.addObject("matchList", matchList);
        MatchPkInfo matchPkInfo=matchPkInfoService.selectById(battleId);
        mv.addObject("matchPkInfo", matchPkInfo);
        mv.setViewName("updateMatchPk");
        return mv;
    }

    @RequestMapping("/saveMatchPk")
    public ModelAndView addMatchPk(ModelAndView mv,MatchPkInfo matchPkInfo){
        matchPkInfoService.insert(matchPkInfo);

        return selectMatchPk(null, mv, null, null);
    }

    @RequestMapping("/updateBattleFlag")
    public String updateBattleFlag(MatchPkInfo matchPkInfo){
        matchPkInfoService.updateFlag(matchPkInfo);
        return "redirect:/Mpk/selectMatchPk";
    }



}
