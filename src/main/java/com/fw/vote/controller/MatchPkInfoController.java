package com.fw.vote.controller;

import com.fw.vote.model.MatchPk;
import com.fw.vote.model.Player;
import com.fw.vote.model.User;
import com.fw.vote.model.Vote;
import com.fw.vote.service.MatchPkService;
import com.fw.vote.service.MatchService;
import com.fw.vote.service.PlayerService;
import com.fw.vote.service.VoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;

@Controller
@RequestMapping("pk")
public class MatchPkInfoController {
    @Autowired
    MatchPkService matchPkService;

    @Autowired
    PlayerService playerService;

    @Autowired
    MatchService matchService;
    @Autowired
    VoteService voteService;




    @RequestMapping("listpk")
    public ModelAndView select(MatchPk matchPk, ModelAndView mv, HttpSession session ){
        User user= (User) session.getAttribute("user");
        if(user==null){
            mv.setViewName("login");
            return mv;
        }
        matchPk.setGrade(user.getGrade());
        List<MatchPk> matchPkList=matchPkService.selectListByGradeAndMatchId(matchPk);
        List<Vote> votes = voteService.selectByUserId(user.getUserid());
        if(matchPkList!=null){
            if(votes!=null&&!votes.isEmpty()){
                for (Vote vote : votes) {
                    for(MatchPk pk :matchPkList){
                        if(pk.getBattleId().equals(vote.getBattleId()) ){
                            pk.setBattleFlag("已投票");
                        }
                    }
            
                }
        
            }
        }

        mv.addObject("matchList", matchPkList);
        mv.addObject("user", user);
        mv.setViewName("voteList");
        return mv;
    }
    
    @RequestMapping("tlistpk")
    public ModelAndView selecttlist(MatchPk matchPk, ModelAndView mv, HttpSession session ){
        User user= (User) session.getAttribute("user");
        if(user==null){
            mv.setViewName("login");
            return mv;
        }
        Player teacher = playerService.selectByNo(user.getAccount());
        matchPk.setFirstPlayerId(teacher.getPlayerId());
        List<MatchPk> matchPkList=matchPkService.selectListByGradeAndMatchIdAndTeacher(matchPk);
        mv.addObject("matchList", matchPkList);
        mv.addObject("user", user);
        mv.setViewName("tvoteList");
        return mv;
    }
}
